{
  description = "Nix Container Images Collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix2container }:
    let
      # Supported systems for container images (Linux only)
      linuxSystems = [ "x86_64-linux" "aarch64-linux" ];

      # Supported systems for pipeline scripts (includes macOS for local dev)
      allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      # Helper to generate outputs for each system
      forAllSystems = nixpkgs.lib.genAttrs allSystems;
      forLinuxSystems = nixpkgs.lib.genAttrs linuxSystems;

      # Use a reference pkgs for discovery (doesn't affect builds)
      refPkgs = nixpkgs.legacyPackages.x86_64-linux;

      # Import chart definitions (architecture-independent)
      chartDefs = import ./charts.nix;

      # Import image categories
      imageCategories = import ./lib/categories.nix;

      # Discover images once (architecture-independent)
      imagesPath = ./images;
      discoveredImages = let
        allFiles = refPkgs.lib.filesystem.listFilesRecursive ./images;
        imageFiles = builtins.filter (path:
          let
            pathStr = toString path;
            relativePath = refPkgs.lib.removePrefix (toString ./images + "/") pathStr;
            parts = refPkgs.lib.splitString "/" relativePath;
          in
            builtins.length parts == 2 &&
            builtins.elemAt parts 1 == "default.nix" &&
            !(builtins.any (part: part == "fake_nixpkgs" || part == "root" || part == "patches") parts)
        ) allFiles;
        imageNamesList = map (path:
          let
            pathStr = toString path;
            relativePath = refPkgs.lib.removePrefix (toString ./images + "/") pathStr;
            parts = refPkgs.lib.splitString "/" relativePath;
          in
            builtins.elemAt parts 0
        ) imageFiles;
      in
        refPkgs.lib.lists.unique imageNamesList;

      # Import user's image selection config
      imageBuildConfig = import ./images-to-build.nix;

      # Helper function to check if a string matches a glob pattern
      matchesPattern = pattern: name:
        let
          # Simple glob matching: * at start, end, or both
          hasStartWildcard = refPkgs.lib.hasPrefix "*" pattern;
          hasEndWildcard = refPkgs.lib.hasSuffix "*" pattern;
          stripped = refPkgs.lib.removePrefix "*" (refPkgs.lib.removeSuffix "*" pattern);
        in
          if pattern == name then true
          else if hasStartWildcard && hasEndWildcard then
            refPkgs.lib.hasInfix stripped name
          else if hasStartWildcard then
            refPkgs.lib.hasSuffix stripped name
          else if hasEndWildcard then
            refPkgs.lib.hasPrefix stripped name
          else
            pattern == name;

      # Expand categories and patterns to image names
      expandImageSpec = spec:
        if refPkgs.lib.hasPrefix "@" spec then
          # Category reference
          let categoryName = refPkgs.lib.removePrefix "@" spec;
          in imageCategories.${categoryName} or []
        else if refPkgs.lib.hasInfix "*" spec then
          # Glob pattern
          builtins.filter (matchesPattern spec) discoveredImages
        else
          # Exact name
          if builtins.elem spec discoveredImages then [ spec ] else [];

      # Get selected images from config
      selectedImages =
        let
          expanded = refPkgs.lib.flatten (map expandImageSpec imageBuildConfig.images);
          excluded = refPkgs.lib.flatten (map expandImageSpec (imageBuildConfig.exclude or []));
        in
          refPkgs.lib.filter (img: !(builtins.elem img excluded)) expanded;

      # Generate packages for a specific system
      mkPackages = system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
            };
            overlays = [
              # Custom packages overlay
              (final: prev: import ./pkgs { pkgs = final; })
            ];
          };

          # Import lib functions
          lib = {
            base = pkgs.callPackage ./lib/base.nix {};
            nonRoot = pkgs.callPackage ./lib/nonRoot.nix {};
            devShell = pkgs.callPackage ./lib/devShell.nix {};
            mkImage = pkgs.callPackage ./lib/mkImage.nix {
              nix2container = nix2container.packages.${system}.nix2container;
              inherit (pkgs) lib;
              base = pkgs.callPackage ./lib/base.nix {};
            };
            mkUserEnvironment = pkgs.callPackage ./lib/mkUserEnvironment.nix {};
            importDir = pkgs.callPackage ./lib/importDir.nix {};
            mkDevImage = pkgs.callPackage ./lib/mkDevImage.nix {
              nix2container = nix2container.packages.${system}.nix2container;
              inherit (pkgs) lib buildEnv;
              devShell = pkgs.callPackage ./lib/devShell.nix {};
            };
          };

          # Import version lookup function
          getPackageVersion = import ./lib/versions.nix { inherit pkgs; };

          # Create images
          images = builtins.listToAttrs (map (imageName: {
            name = imageName;
            value = pkgs.callPackage (imagesPath + "/${imageName}") {
              inherit (lib) mkImage mkUserEnvironment base nonRoot;
              nix2container = nix2container.packages.${system}.nix2container;
              inherit pkgs;
            };
          }) discoveredImages);

          # Create version-tagged images
          versionedImages = builtins.listToAttrs (map (imageName:
            let
              baseImage = images.${imageName};
              version = getPackageVersion imageName;
            in {
              name = "${imageName}-${version}";
              value = baseImage // { tag = version; };
            }
          ) discoveredImages);

          # Create dev variants of all images
          devImages = builtins.listToAttrs (map (imageName:
            let
              baseImage = images.${imageName};
            in {
              name = "${imageName}-dev";
              value = lib.mkDevImage {
                inherit baseImage;
                devLevel = "standard";
              };
            }
          ) discoveredImages);

          # Import manifest generator
          manifest = import ./lib/manifest.nix {
            inherit pkgs images getPackageVersion discoveredImages;
          };

          imageNames = builtins.attrNames images;

          # Discovery script
          discoveryScript = pkgs.writeShellScript "discover-images" ''
            echo "Discovering images using Nix evaluation..."
            ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" eval --json .#discoveredImages
          '';

          # Load all images script
          loadAllScript = pkgs.writeShellScript "load-all-images" ''
            echo "Loading all container images to Docker..."
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: image: ''
              echo "Loading ${name} to Docker..."
              ${image.copyToDockerDaemon}/bin/copy-to-docker-daemon
            '') images)}
            echo "All images loaded successfully!"
          '';

          # Image tests
          imageTests = builtins.listToAttrs (builtins.filter (x: x != null) (map (imageName:
            let
              testPath = imagesPath + "/${imageName}/test.nix";
            in
              if builtins.pathExists testPath
              then {
                name = "${imageName}-test";
                value = pkgs.stdenv.mkDerivation {
                  name = "${imageName}-test";
                  buildCommand = ''
                    mkdir -p $out/bin
                    cp ${pkgs.callPackage testPath { image = images.${imageName}; }} $out/bin/${imageName}-test
                    chmod +x $out/bin/${imageName}-test
                  '';
                };
              }
              else null
          ) discoveredImages));

          # Test runner script
          testImagesScript = pkgs.writeShellScript "test-images" ''
            set -euo pipefail
            echo "Testing all container images..."
            TOTAL=0
            SUCCESS=0
            for IMAGE_NAME in ${pkgs.lib.concatStringsSep " " imageNames}; do
              echo "Building: $IMAGE_NAME"
              TOTAL=$((TOTAL + 1))
              if ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" build ".#$IMAGE_NAME" --print-build-logs; then
                echo "  OK: $IMAGE_NAME"
                SUCCESS=$((SUCCESS + 1))
              else
                echo "  FAIL: $IMAGE_NAME"
              fi
            done
            echo "Summary: $SUCCESS/$TOTAL images built successfully"
            [ $SUCCESS -eq $TOTAL ]
          '';

          # Script to pull all charts (defined in let block so it can be referenced by platform-bundle)
          pullAllChartsScript = pkgs.writeShellScriptBin "pull-all-charts" ''
            set -euo pipefail
            CHART_DIR="''${1:-./charts}"
            mkdir -p "$CHART_DIR"

            echo "Pulling all Helm charts to $CHART_DIR..."

            # Infrastructure charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.infrastructure)}

            # ML Platform charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.ml-platform)}

            # Observability charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.observability)}

            # Security charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.security)}

            # GitOps charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.gitops)}

            # Service Mesh charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.service-mesh)}

            # Backup charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.backup)}

            echo "Done! Charts saved to $CHART_DIR"
            ls -la "$CHART_DIR"
          '';

        in
          images //
          versionedImages //
          devImages //
          imageTests //
          (builtins.listToAttrs (map (imageName: {
            name = "load-${imageName}-to-docker";
            value = images.${imageName}.copyToDockerDaemon;
          }) imageNames)) // {

          # Manifest for all images
          generate-manifest = manifest.generateManifest;
          manifest-json = manifest.manifestFile;

          # Build all images at once (creates a derivation that depends on all images)
          all-images = pkgs.symlinkJoin {
            name = "all-images";
            paths = builtins.attrValues images;
          };

          # Build selected images from images-to-build.nix
          selected-images = pkgs.symlinkJoin {
            name = "selected-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) selectedImages);
          };

          # Category-based image builds
          infrastructure-images = pkgs.symlinkJoin {
            name = "infrastructure-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.infrastructure);
          };

          database-images = pkgs.symlinkJoin {
            name = "database-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.database);
          };

          web-images = pkgs.symlinkJoin {
            name = "web-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.web);
          };

          runtime-images = pkgs.symlinkJoin {
            name = "runtime-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.runtime);
          };

          cli-images = pkgs.symlinkJoin {
            name = "cli-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.cli);
          };

          devops-images = pkgs.symlinkJoin {
            name = "devops-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.devops);
          };

          nix-images = pkgs.symlinkJoin {
            name = "nix-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.nix);
          };

          build-images = pkgs.symlinkJoin {
            name = "build-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.build);
          };

          # List selected images script
          list-selected = pkgs.writeShellScriptBin "list-selected" ''
            echo "Selected images from images-to-build.nix:"
            ${pkgs.lib.concatStringsSep "\n" (map (name: ''echo "  - ${name}"'') selectedImages)}
            echo ""
            echo "Total: ${toString (builtins.length selectedImages)} images"
          '';

          # Load all images at once
          load-all-to-docker = pkgs.stdenv.mkDerivation {
            name = "load-all-to-docker";
            buildCommand = ''
              mkdir -p $out/bin
              cp ${loadAllScript} $out/bin/load-all-to-docker
              chmod +x $out/bin/load-all-to-docker
            '';
          };

          # Discovery script
          discover-images = pkgs.stdenv.mkDerivation {
            name = "discover-images";
            buildCommand = ''
              mkdir -p $out/bin
              cp ${discoveryScript} $out/bin/discover-images
              chmod +x $out/bin/discover-images
            '';
          };

          # Test all images
          test-all-images = pkgs.stdenv.mkDerivation {
            name = "test-all-images";
            buildCommand = ''
              mkdir -p $out/bin
              cp ${testImagesScript} $out/bin/test-all-images
              chmod +x $out/bin/test-all-images
            '';
          };

          # Version checker script
          check-versions = pkgs.writeShellScriptBin "check-versions" ''
            echo "Package versions:"
            ${pkgs.lib.concatStringsSep "\n" (map (imageName:
              let version = getPackageVersion imageName; in
              ''echo "  ${imageName}: ${version}"''
            ) discoveredImages)}
          '';

          # Static website generator
          website = pkgs.stdenv.mkDerivation {
            name = "nix-containers-website";
            dontUnpack = true;
            buildPhase = ''
              mkdir -p $out
              cp ${./website/static/index.html} $out/index.html
              cp ${./website/static/app.js} $out/app.js
              cat > $out/images-data.json << 'EOF'
              {
                "images": ${builtins.toJSON (map (imageName:
                  let
                    imageConfig = images.${imageName}.config or {};
                    labels = imageConfig.Labels or {};
                    version = getPackageVersion imageName;
                  in {
                    name = imageName;
                    description = labels."org.opencontainers.image.description" or "Container image for ${imageName}";
                    version = version;
                    category = labels."io.nix-containers.image.category" or "utility";
                    hasTest = builtins.pathExists (./images + "/${imageName}/test.nix");
                    pullCommand = "docker pull ghcr.io/nix-containers/images/${imageName}:latest";
                    upstream = labels."io.nix-containers.image.upstream" or "";
                    aliases = labels."io.nix-containers.image.aliases" or imageName;
                    size = "Not built";
                    readme = if builtins.pathExists (./images + "/${imageName}/README.md")
                             then builtins.readFile (./images + "/${imageName}/README.md")
                             else "# ${imageName}\n\nNo README available.";
                  }) discoveredImages)},
                "totalCount": ${toString (builtins.length discoveredImages)},
                "lastUpdated": "BUILD_TIME"
              }
              EOF
              ${pkgs.gnused}/bin/sed -i "s/BUILD_TIME/$(date -Iseconds)/g" $out/images-data.json
            '';
            installPhase = ''
              echo "Static website generated"
            '';
          };

          # Expose the chart puller script
          pull-all-charts = pullAllChartsScript;

          # Package bundle: all images + chart puller
          platform-bundle = pkgs.symlinkJoin {
            name = "platform-bundle";
            paths = [
              (pkgs.symlinkJoin { name = "all-images"; paths = builtins.attrValues images; })
              pullAllChartsScript
            ];
          };

        } // (import ./lib/pipelines.nix {
          inherit pkgs imageNames selectedImages imageCategories getPackageVersion discoveredImages;
        }) // (import ./lib/chart-tools.nix {
          inherit pkgs;
          chartDefs = chartDefs;
        });

      # Generate devShells for a specific system
      mkDevShells = system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nix
              docker
              act
              jq
              git
              gh
              gnumake
              just
            ];
            shellHook = ''
              echo "Nix Containers Development Environment"
              echo ""
              echo "Pipeline commands (local CI):"
              echo "  nix run .#pipeline             [target]  - Full pipeline (build, test, push)"
              echo "  nix run .#pipeline-build       [target]  - Build images"
              echo "  nix run .#pipeline-test        [target]  - Test images"
              echo "  nix run .#pipeline-push        [target]  - Push to registry"
              echo "  nix run .#pipeline-check-versions       - Check for version changes"
              echo "  nix run .#pipeline-save-versions        - Save current versions"
              echo ""
              echo "  Targets: all, selected, <category>, or <image-name>"
              echo "  Environment: SKIP_TEST=true SKIP_PUSH=true PARALLEL=4"
              echo ""
              echo "Direct build commands:"
              echo "  nix build .#<image-name>           - Build single image"
              echo "  nix build .#all-images             - Build ALL images"
              echo "  nix build .#selected-images        - Build images from images-to-build.nix"
              echo "  nix build .#<category>-images      - Build by category"
              echo ""
              echo "Categories: infrastructure, database, web, runtime, cli, devops, nix, build"
              echo ""
              echo "Available images: ${toString (builtins.length discoveredImages)}"
              echo "Selected images: ${toString (builtins.length selectedImages)}"
            '';
          };

          website-dev = pkgs.mkShell {
            buildInputs = with pkgs; [ nodejs npm python3 ];
            shellHook = ''
              echo "Static Website Development Environment"
              echo "  nix build .#website - Generate static site"
            '';
          };
        };

      # Generate pipeline-only packages for Darwin systems
      mkDarwinPackages = system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
          };

          # Import version lookup function (uses x86_64-linux as reference)
          getPackageVersion = import ./lib/versions.nix {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
          };

          imageNames = discoveredImages;

          # Import manifest generator (no images needed, just metadata)
          manifest = import ./lib/manifest.nix {
            inherit pkgs getPackageVersion discoveredImages;
            images = {};  # No images on Darwin
          };

          pipelines = import ./lib/pipelines.nix {
            inherit pkgs imageNames selectedImages imageCategories getPackageVersion discoveredImages;
          };

          chartTools = import ./lib/chart-tools.nix {
            inherit pkgs;
            chartDefs = chartDefs;
          };

        in pipelines // chartTools // {
          generate-manifest = manifest.generateManifest;
          manifest-json = manifest.manifestFile;
        };

    in {
      # Generate packages for Linux systems (includes container images)
      # Generate packages for Darwin systems (pipeline scripts only)
      packages = forLinuxSystems mkPackages // {
        x86_64-darwin = mkDarwinPackages "x86_64-darwin";
        aarch64-darwin = mkDarwinPackages "aarch64-darwin";
      };

      # Generate devShells for all supported systems
      devShells = forAllSystems mkDevShells;

      # Export discovered images for external use
      inherit discoveredImages;

      # Export selected images (from images-to-build.nix)
      inherit selectedImages;

      # Export image categories
      inherit imageCategories;

      # Export chart definitions
      chartDefinitions = import ./charts.nix;

      # Helper to get image names
      imageNames = discoveredImages;

      # Helper function for version lookup (uses x86_64-linux as reference)
      getPackageVersion = import ./lib/versions.nix {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
    };
}

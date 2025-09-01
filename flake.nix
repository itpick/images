{
  description = "Nix Container Images Collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix2container }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Import lib functions following docker-nixpkgs pattern
      lib = {
        base = pkgs.callPackage ./lib/base.nix {};
        nonRoot = pkgs.callPackage ./lib/nonRoot.nix {};
        buildCLIImage = pkgs.callPackage ./lib/buildCLIImage.nix { 
          nix2container = nix2container.packages.${system}.nix2container;
          inherit (pkgs) lib;
          base = pkgs.callPackage ./lib/base.nix {};
        };
        mkUserEnvironment = pkgs.callPackage ./lib/mkUserEnvironment.nix {};
        importDir = pkgs.callPackage ./lib/importDir.nix {};
      };

      # Dynamically discover and import all image folders using filesystem discovery
      imagesPath = ./images;
      images = builtins.listToAttrs (map (imageName: {
        name = imageName;
        value = pkgs.callPackage (imagesPath + "/${imageName}") {
          inherit (lib) buildCLIImage mkUserEnvironment base nonRoot;
          nix2container = nix2container.packages.${system}.nix2container;
          inherit pkgs;
        };
      }) discoveredImages);
      
      # Get image names for helper scripts
      imageNames = builtins.attrNames images;

      # Use pkgs.lib.filesystem.listFilesRecursive for comprehensive discovery
      discoveredImages = let
        allFiles = pkgs.lib.filesystem.listFilesRecursive ./images;
        # Filter for default.nix files and extract directory names
        imageFiles = builtins.filter (path: 
          let
            pathStr = toString path;
            # Check if it's a default.nix file directly in an image directory (not subdirectories)
            relativePath = pkgs.lib.removePrefix (toString ./images + "/") pathStr;
            parts = pkgs.lib.splitString "/" relativePath;
          in
            builtins.length parts == 2 && 
            builtins.elemAt parts 1 == "default.nix" &&
            # Exclude subdirectories like nix/fake_nixpkgs/default.nix
            !(builtins.any (part: part == "fake_nixpkgs" || part == "root" || part == "patches") parts)
        ) allFiles;
        
        # Extract unique image directory names
        imageNamesList = map (path:
          let
            pathStr = toString path;
            relativePath = pkgs.lib.removePrefix (toString ./images + "/") pathStr;
            parts = pkgs.lib.splitString "/" relativePath;
          in
            builtins.elemAt parts 0
        ) imageFiles;
      in
        pkgs.lib.lists.unique imageNamesList;

      # Discovery script for local testing
      discoveryScript = pkgs.writeShellScript "discover-images" ''
        echo "🔍 Discovering images using Nix evaluation..."
        ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" eval --json .#discoveredImages
      '';

      # Helper script to load all images to Docker at once
      loadAllScript = pkgs.writeShellScript "load-all-images" ''
        echo "🔄 Loading all container images to Docker..."
        
        ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: image: ''
          echo "🔄 Loading ${name} to Docker..."
          ${image.copyToDockerDaemon}/bin/copy-to-docker-daemon
        '') images)}
        
        echo "✅ All images loaded successfully!"
        echo ""
        echo "Available Docker images:"
        docker images | grep -E "(${pkgs.lib.concatStringsSep "|" imageNames})" || echo "No images found (run 'docker images' to verify)"
      '';

      # Discover and create tests for images that have test.nix files
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

      # Test runner script for all images with tests
      testImagesScript = pkgs.writeShellScript "test-images" ''
        set -euo pipefail
        
        echo "🧪 Testing all container images with comprehensive tests..."
        
        TOTAL_IMAGES=0
        SUCCESSFUL_BUILDS=0
        SUCCESSFUL_LOADS=0
        SUCCESSFUL_TESTS=0
        
        # Test images that have specific test files
        IMAGES_WITH_TESTS="${pkgs.lib.concatStringsSep " " (builtins.attrNames imageTests)}"
        
        for TEST_NAME in $IMAGES_WITH_TESTS; do
          IMAGE_NAME="''${TEST_NAME%-test}"
          echo "----------------------------------------"
          echo "🔨 Testing image: $IMAGE_NAME (with custom tests)"
          TOTAL_IMAGES=$((TOTAL_IMAGES + 1))
          
          # Test 1: Build the image
          echo "  📦 Building image..."
          if ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" build ".#$IMAGE_NAME" --print-build-logs; then
            echo "  ✅ Build successful"
            SUCCESSFUL_BUILDS=$((SUCCESSFUL_BUILDS + 1))
            
            # Test 2: Load to Docker
            echo "  🐳 Loading to Docker..."
            if ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" run ".#$IMAGE_NAME.copyTo" -- docker-daemon:"$IMAGE_NAME:test"; then
              echo "  ✅ Docker load successful"
              SUCCESSFUL_LOADS=$((SUCCESSFUL_LOADS + 1))
              
              # Test 3: Run comprehensive tests
              echo "  🧪 Running comprehensive tests..."
              if ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" run ".#$TEST_NAME"; then
                echo "  ✅ Comprehensive tests passed"
                SUCCESSFUL_TESTS=$((SUCCESSFUL_TESTS + 1))
              else
                echo "  ❌ Comprehensive tests failed"
              fi
              
              # Clean up test image
              docker rmi "$IMAGE_NAME:test" >/dev/null 2>&1 || true
            else
              echo "  ❌ Docker load failed"
            fi
          else
            echo "  ❌ Build failed"
          fi
        done
        
        # Test remaining images with basic tests
        for IMAGE_NAME in ${pkgs.lib.concatStringsSep " " imageNames}; do
          # Skip if already tested above
          if echo "$IMAGES_WITH_TESTS" | grep -q "$IMAGE_NAME-test"; then
            continue
          fi
          
          echo "----------------------------------------"
          echo "🔨 Testing image: $IMAGE_NAME (basic tests)"
          TOTAL_IMAGES=$((TOTAL_IMAGES + 1))
          
          # Test 1: Build the image
          echo "  📦 Building image..."
          if ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" build ".#$IMAGE_NAME" --print-build-logs; then
            echo "  ✅ Build successful"
            SUCCESSFUL_BUILDS=$((SUCCESSFUL_BUILDS + 1))
            
            # Test 2: Load to Docker
            echo "  🐳 Loading to Docker..."
            if ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" run ".#$IMAGE_NAME.copyTo" -- docker-daemon:"$IMAGE_NAME:test"; then
              echo "  ✅ Docker load successful"
              SUCCESSFUL_LOADS=$((SUCCESSFUL_LOADS + 1))
              
              # Test 3: Basic functionality test
              echo "  🔍 Testing basic functionality..."
              if docker run --rm "$IMAGE_NAME:test" --version >/dev/null 2>&1 || \
                 docker run --rm "$IMAGE_NAME:test" --help >/dev/null 2>&1 || \
                 docker run --rm "$IMAGE_NAME:test" true >/dev/null 2>&1; then
                echo "  ✅ Basic functionality test passed"
                SUCCESSFUL_TESTS=$((SUCCESSFUL_TESTS + 1))
              else
                echo "  ⚠️  Basic functionality test failed (may be expected for some images)"
              fi
              
              # Clean up test image
              docker rmi "$IMAGE_NAME:test" >/dev/null 2>&1 || true
            else
              echo "  ❌ Docker load failed"
            fi
          else
            echo "  ❌ Build failed"
          fi
        done
        
        echo "========================================"
        echo "📊 Test Summary:"
        echo "  Total images: $TOTAL_IMAGES"
        echo "  Successful builds: $SUCCESSFUL_BUILDS/$TOTAL_IMAGES"
        echo "  Successful Docker loads: $SUCCESSFUL_LOADS/$TOTAL_IMAGES"
        echo "  Successful functionality tests: $SUCCESSFUL_TESTS/$TOTAL_IMAGES"
        
        if [ $SUCCESSFUL_BUILDS -eq $TOTAL_IMAGES ]; then
          echo "🎉 All images built successfully!"
          exit 0
        else
          echo "❌ Some images failed to build"
          exit 1
        fi
      '';

    in {
      packages.${system} = images // 
        # Include individual image tests
        imageTests //
        # Dynamically generate Docker loaders for all images
        (builtins.listToAttrs (map (imageName: {
          name = "load-${imageName}-to-docker";
          value = images.${imageName}.copyToDockerDaemon;
        }) imageNames)) // {
        
        # Load all images at once
        load-all-to-docker = pkgs.stdenv.mkDerivation {
          name = "load-all-to-docker";
          buildCommand = ''
            mkdir -p $out/bin
            cp ${loadAllScript} $out/bin/load-all-to-docker
            chmod +x $out/bin/load-all-to-docker
          '';
        };
        
        # Discovery script using lib.filesystem.listFilesRecursive
        discover-images = pkgs.stdenv.mkDerivation {
          name = "discover-images";
          buildCommand = ''
            mkdir -p $out/bin
            cp ${discoveryScript} $out/bin/discover-images
            chmod +x $out/bin/discover-images
          '';
        };
        
        # Comprehensive test suite
        test-all-images = pkgs.stdenv.mkDerivation {
          name = "test-all-images";
          buildCommand = ''
            mkdir -p $out/bin
            cp ${testImagesScript} $out/bin/test-all-images
            chmod +x $out/bin/test-all-images
          '';
        };
      };

      # Export discovered images and traditional names for external use
      inherit discoveredImages imageNames;

      # Development shells for each image
      devShells.${system} = {
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
            echo "🚀 Nix Containers Development Environment"
            echo ""
            echo "📦 Local Building:"
            echo "  nix build .#<image-name>                    - Build container image"
            echo "  nix build .#load-<image-name>-to-docker     - Build and load to Docker"
            echo "  nix build .#load-all-to-docker && ./result/bin/load-all-to-docker"
            echo ""
            echo "🐳 Docker Commands:"
            echo "  docker images                               - List Docker images"
            echo "  docker run -it <image-name> bash           - Run container interactively"
            echo ""
            echo "🔄 GitHub Actions Testing:"
            echo "  act -l                                      - List available workflows"
            echo "  act -j build-containers                     - Test build workflow locally"
            echo "  act --container-architecture linux/amd64   - Force x86_64 architecture"
            echo ""
            echo "📊 Scripts:"
            echo "  ./scripts/update-image-stats.sh            - Update README comparison chart"
            echo "  ./scripts/update-readme-images.sh          - Update README available images section"
            echo ""
            echo "📋 Available images:"
            echo "  ${pkgs.lib.concatStringsSep ", " imageNames}"
            echo ""
            echo "💡 Quick start:"
            echo "  nix build .#load-cpp-runtime-to-docker     - Example: build and load cpp-runtime"
          '';
        };
      };
    };
}
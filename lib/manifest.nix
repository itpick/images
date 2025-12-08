# Manifest Generator
# ===================
# Generates a JSON manifest file containing all built image metadata.
# This is created at build time and includes:
# - Image names and versions
# - Available tags (latest, version, version-dev)
# - OCI metadata labels
# - Build timestamp
#
# Usage:
#   let manifest = import ./lib/manifest.nix { inherit pkgs images getPackageVersion discoveredImages; };
#   in manifest.generateManifest

{ pkgs, images, getPackageVersion, discoveredImages, ... }:

let
  inherit (pkgs) lib;

  # Helper to ensure version is a string
  toVersionString = v: if builtins.isString v then v else toString v;

  # Sanitize version for Docker tag (replace + with -)
  sanitizeVersion = v: builtins.replaceStrings ["+"] ["-"] (toVersionString v);

  # Generate image metadata
  mkImageMeta = imageName:
    let
      image = images.${imageName} or null;
      version = sanitizeVersion (getPackageVersion imageName);
      imageConfig = if image != null then (image.config or {}) else {};
      labels = imageConfig.Labels or {};
    in {
      name = imageName;
      version = version;
      tags = [
        "latest"
        version
        "${version}-dev"
        "latest-dev"
      ];
      labels = {
        description = labels."org.opencontainers.image.description" or "Container image for ${imageName}";
        category = labels."io.nix-containers.image.category" or "utility";
        upstream = labels."io.nix-containers.image.upstream" or "";
        aliases = labels."io.nix-containers.image.aliases" or imageName;
      };
      pullCommands = {
        latest = "docker pull ghcr.io/nix-containers/${imageName}:latest";
        version = "docker pull ghcr.io/nix-containers/${imageName}:${version}";
        dev = "docker pull ghcr.io/nix-containers/${imageName}:${version}-dev";
      };
    };

  # Generate full manifest
  manifestData = {
    version = "1.0";
    generated = "BUILD_TIME";  # Replaced at build time
    totalImages = builtins.length discoveredImages;
    images = map mkImageMeta discoveredImages;
    categories = {
      database = builtins.filter (img:
        let labels = (images.${img}.config or {}).Labels or {};
        in (labels."io.nix-containers.image.category" or "") == "database"
      ) discoveredImages;
      runtime = builtins.filter (img:
        let labels = (images.${img}.config or {}).Labels or {};
        in (labels."io.nix-containers.image.category" or "") == "runtime"
      ) discoveredImages;
      web = builtins.filter (img:
        let labels = (images.${img}.config or {}).Labels or {};
        in builtins.elem (labels."io.nix-containers.image.category" or "") ["web" "web-service"]
      ) discoveredImages;
      cli = builtins.filter (img:
        let labels = (images.${img}.config or {}).Labels or {};
        in (labels."io.nix-containers.image.category" or "") == "cli-tool"
      ) discoveredImages;
      devops = builtins.filter (img:
        let labels = (images.${img}.config or {}).Labels or {};
        in (labels."io.nix-containers.image.category" or "") == "devops"
      ) discoveredImages;
      nix = builtins.filter (img:
        let labels = (images.${img}.config or {}).Labels or {};
        in (labels."io.nix-containers.image.category" or "") == "nix"
      ) discoveredImages;
      build = builtins.filter (img:
        let labels = (images.${img}.config or {}).Labels or {};
        in builtins.elem (labels."io.nix-containers.image.category" or "") ["build" "build-env"]
      ) discoveredImages;
    };
  };

in {
  # Export the manifest data as JSON
  manifestJson = builtins.toJSON manifestData;

  # Generate a script that outputs the manifest
  generateManifest = pkgs.writeShellScriptBin "generate-manifest" ''
    cat << 'EOF'
${builtins.toJSON manifestData}
EOF
  '';

  # Generate a derivation that produces the manifest file
  manifestFile = pkgs.runCommand "nix-containers-manifest.json" {} ''
    cat > $out << 'EOF'
${builtins.toJSON manifestData}
EOF
    # Replace BUILD_TIME placeholder with actual build time
    ${pkgs.gnused}/bin/sed -i "s/BUILD_TIME/$(date -Iseconds)/g" $out
  '';

  # Simple version map for quick lookups
  versionMap = builtins.listToAttrs (map (imageName: {
    name = imageName;
    value = sanitizeVersion (getPackageVersion imageName);
  }) discoveredImages);
}

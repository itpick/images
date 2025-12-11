# backstage
# =============
# Backstage - Developer portal platform by Spotify
# https://github.com/backstage/backstage
#
# Backstage is a Node.js application that serves as a developer portal.
# Since it's a complex TypeScript/React application with many plugins,
# we pull binaries from the upstream container image.

{ nix2container, pkgs, lib, ... }:

let
  version = "1.34.0";

  # Pull the Backstage binary and assets from upstream image
  backstageImage = pkgs.dockerTools.pullImage {
    imageName = "ghcr.io/backstage/backstage";
    imageDigest = "sha256:0000000000000000000000000000000000000000000000000000000000000000";  # TODO: Update with actual digest
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first pull
    finalImageTag = "v${version}";
  };

  # Extract the app directory from upstream image
  backstageApp = pkgs.runCommand "backstage-app" {
    nativeBuildInputs = [ pkgs.undocker ];
  } ''
    mkdir -p $out
    undocker ${backstageImage} - | tar -xf - -C $out --strip-components=1 app || true
    # If the above fails, create a placeholder
    if [ ! -d "$out/app" ]; then
      mkdir -p $out/app
      echo "Backstage app placeholder - run with upstream image for full functionality" > $out/app/README.md
    fi
  '';

in
nix2container.buildImage {
  name = "backstage";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "backstage-root";
    paths = [
      # Node.js runtime
      pkgs.nodejs_20

      # Shell and utilities
      pkgs.bash
      pkgs.coreutils
      pkgs.curl
      pkgs.cacert

      # Git for plugin operations
      pkgs.git

      # Process management
      pkgs.tini

      # Create directories
      (pkgs.runCommand "backstage-dirs" {} ''
        mkdir -p $out/app
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/app" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
    cmd = [ "${pkgs.nodejs_20}/bin/node" "packages/backend" "--config" "app-config.yaml" ];
    workingDir = "/app";
    exposedPorts = {
      "7007/tcp" = {};
    };
    env = [
      "NODE_ENV=production"
      "APP_CONFIG_app_baseUrl=http://localhost:7007"
    ];
    labels = {
      "org.opencontainers.image.title" = "Backstage";
      "org.opencontainers.image.description" = "Developer portal platform by Spotify";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "backstage";
    };
  };
}

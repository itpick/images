# twistlock-console
# =============
# Twistlock Console - Prisma Cloud Compute Console
# https://www.paloaltonetworks.com/prisma/cloud
#
# Twistlock (now Prisma Cloud Compute) Console is the management
# interface for the Prisma Cloud container security platform.
# It provides vulnerability scanning, compliance, and runtime protection.
#
# NOTE: This is a commercial product from Palo Alto Networks.
# Binaries are not publicly available.
# For deployment, you need to:
# 1. Download from Palo Alto Networks with valid license
# 2. Pull from their registry with credentials
#
# This implementation provides a placeholder container.
# For actual deployment, pull the official image from Palo Alto.

{ nix2container, pkgs, lib, ... }:

let
  version = "32.07";

  # Create a placeholder startup script
  consoleScript = pkgs.writeShellScriptBin "twistlock-console" ''
    #!/usr/bin/env bash
    echo "============================================"
    echo "Twistlock Console (Prisma Cloud Compute)"
    echo "============================================"
    echo ""
    echo "This is a placeholder container."
    echo "Twistlock/Prisma Cloud is a commercial product."
    echo ""
    echo "To deploy the actual console:"
    echo "1. Obtain a license from Palo Alto Networks"
    echo "2. Download the official container image"
    echo "3. Follow the Prisma Cloud deployment guide"
    echo ""
    echo "Documentation: https://docs.paloaltonetworks.com/prisma/prisma-cloud"
    echo ""

    if [ "''${KEEP_RUNNING:-true}" = "true" ]; then
      echo "Container running in placeholder mode..."
      exec sleep infinity
    fi
  '';

in
nix2container.buildImage {
  name = "twistlock-console";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "twistlock-console-root";
    paths = [
      consoleScript

      # Runtime utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "twistlock-console-dirs" {} ''
        mkdir -p $out/var/lib/twistlock
        mkdir -p $out/var/log/twistlock
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${consoleScript}/bin/twistlock-console" ];
    cmd = [];
    workingDir = "/var/lib/twistlock";
    exposedPorts = {
      "8081/tcp" = {};  # HTTP
      "8083/tcp" = {};  # HTTPS
      "8084/tcp" = {};  # Management
    };
    env = [
      "KEEP_RUNNING=true"
    ];
    labels = {
      "org.opencontainers.image.title" = "Twistlock Console";
      "org.opencontainers.image.description" = "Prisma Cloud Compute Console (placeholder)";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.note" = "Placeholder - commercial license required";
    };
  };
}

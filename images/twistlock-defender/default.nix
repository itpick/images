# twistlock-defender
# =============
# Twistlock Defender - Prisma Cloud Compute Defender Agent
# https://www.paloaltonetworks.com/prisma/cloud
#
# Twistlock Defender (now Prisma Cloud Compute Defender) is the
# agent that runs on each node to provide runtime protection,
# vulnerability scanning, and compliance enforcement.
#
# NOTE: This is a commercial product from Palo Alto Networks.
# Binaries are not publicly available.
# For deployment, you need to:
# 1. Download from Palo Alto Networks with valid license
# 2. Generate defender images from the Console
#
# This implementation provides a placeholder container.
# For actual deployment, generate defenders from your Twistlock Console.

{ nix2container, pkgs, lib, ... }:

let
  version = "32.07";

  # Create a placeholder defender script
  defenderScript = pkgs.writeShellScriptBin "twistlock-defender" ''
    #!/usr/bin/env bash
    echo "============================================"
    echo "Twistlock Defender (Prisma Cloud Compute)"
    echo "============================================"
    echo ""
    echo "This is a placeholder container."
    echo "Twistlock/Prisma Cloud is a commercial product."
    echo ""
    echo "To deploy actual defenders:"
    echo "1. Deploy Twistlock Console with valid license"
    echo "2. Generate defender images from Console UI"
    echo "3. Deploy defenders to your cluster"
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
  name = "twistlock-defender";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "twistlock-defender-root";
    paths = [
      defenderScript

      # Runtime utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "twistlock-defender-dirs" {} ''
        mkdir -p $out/var/lib/twistlock
        mkdir -p $out/var/log/twistlock
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${defenderScript}/bin/twistlock-defender" ];
    cmd = [];
    workingDir = "/var/lib/twistlock";
    env = [
      "KEEP_RUNNING=true"
    ];
    labels = {
      "org.opencontainers.image.title" = "Twistlock Defender";
      "org.opencontainers.image.description" = "Prisma Cloud Compute Defender (placeholder)";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.note" = "Placeholder - commercial license required";
    };
  };
}

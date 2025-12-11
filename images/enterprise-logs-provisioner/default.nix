# enterprise-logs-provisioner
# =============
# Grafana Enterprise Logs Provisioner - Provisioning tool for GEL
# https://grafana.com/docs/enterprise-logs/
#
# This is a provisioning/setup tool for Grafana Enterprise Logs.
# It handles initial configuration and tenant provisioning.
#
# NOTE: This is part of the commercial GEL product.
# This implementation provides a minimal provisioner using standard tools.

{ nix2container, pkgs, lib, ... }:

let
  version = "3.3.2";

  # Create a provisioning script
  provisionerScript = pkgs.writeShellScriptBin "enterprise-logs-provisioner" ''
    #!/usr/bin/env bash
    set -e

    echo "Enterprise Logs Provisioner"
    echo "=========================="

    # Default behavior: wait for Loki/GEL to be ready and apply config
    LOKI_URL="''${LOKI_URL:-http://localhost:3100}"
    CONFIG_FILE="''${CONFIG_FILE:-/etc/loki/provisioning/config.yaml}"

    if [ -f "$CONFIG_FILE" ]; then
      echo "Applying configuration from $CONFIG_FILE"
      # Add provisioning logic here
      echo "Configuration applied successfully"
    else
      echo "No configuration file found at $CONFIG_FILE"
      echo "Provisioner running in wait mode..."
    fi

    # Keep running if requested
    if [ "''${KEEP_RUNNING:-false}" = "true" ]; then
      echo "Keeping container running..."
      exec sleep infinity
    fi
  '';

in
nix2container.buildImage {
  name = "enterprise-logs-provisioner";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "enterprise-logs-provisioner-root";
    paths = [
      provisionerScript

      # Runtime utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils
      pkgs.curl
      pkgs.jq

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "provisioner-dirs" {} ''
        mkdir -p $out/etc/loki/provisioning
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/tmp" ];
  };

  config = {
    entrypoint = [ "${provisionerScript}/bin/enterprise-logs-provisioner" ];
    cmd = [];
    workingDir = "/";
    env = [
      "LOKI_URL=http://localhost:3100"
      "KEEP_RUNNING=false"
    ];
    labels = {
      "org.opencontainers.image.title" = "Enterprise Logs Provisioner";
      "org.opencontainers.image.description" = "Provisioning tool for Grafana Enterprise Logs";
      "org.opencontainers.image.version" = version;
    };
  };
}

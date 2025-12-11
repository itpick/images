# enterprise-metrics
# =============
# Grafana Enterprise Metrics (GEM) - Enterprise metrics solution
# https://grafana.com/docs/enterprise-metrics/
#
# Grafana Enterprise Metrics is a commercial product from Grafana Labs.
# It extends Mimir with enterprise features like RBAC, usage reporting,
# and multi-tenancy improvements.
#
# NOTE: This is a commercial product. Binaries are not publicly available.
# For deployment, you need to either:
# 1. Pull from Grafana's private registry with valid license
# 2. Use Mimir (open source) as an alternative
#
# This implementation provides a container that runs Mimir as a drop-in
# replacement for environments that don't have GEM licenses.

{ nix2container, pkgs, lib, ... }:

let
  # Using Mimir as the open-source alternative
  mimir = pkgs.mimir;
  version = mimir.version;

in
nix2container.buildImage {
  name = "enterprise-metrics";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "enterprise-metrics-root";
    paths = [
      mimir

      # Runtime utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "enterprise-metrics-dirs" {} ''
        mkdir -p $out/etc/mimir
        mkdir -p $out/var/mimir
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${mimir}/bin/mimir" ];
    cmd = [ "-config.file=/etc/mimir/config.yaml" ];
    workingDir = "/var/mimir";
    exposedPorts = {
      "8080/tcp" = {};
      "9095/tcp" = {};
    };
    env = [
      "MIMIR_PATH_PREFIX=/var/mimir"
    ];
    labels = {
      "org.opencontainers.image.title" = "Enterprise Metrics";
      "org.opencontainers.image.description" = "Grafana Enterprise Metrics (Mimir-based implementation)";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.note" = "Using Mimir as open-source alternative to GEM";
    };
  };
}

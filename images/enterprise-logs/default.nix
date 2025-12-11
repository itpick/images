# enterprise-logs
# =============
# Grafana Enterprise Logs (GEL) - Enterprise logging solution
# https://grafana.com/docs/enterprise-logs/
#
# Grafana Enterprise Logs is a commercial product from Grafana Labs.
# It extends Loki with enterprise features like RBAC, usage reporting,
# and multi-tenancy improvements.
#
# NOTE: This is a commercial product. Binaries are not publicly available.
# For deployment, you need to either:
# 1. Pull from Grafana's private registry with valid license
# 2. Use Loki (open source) as an alternative
#
# This implementation provides a container that runs Loki as a drop-in
# replacement for environments that don't have GEL licenses.

{ nix2container, pkgs, lib, ... }:

let
  # Using Loki as the open-source alternative
  loki = pkgs.grafana-loki;
  version = loki.version;

in
nix2container.buildImage {
  name = "enterprise-logs";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "enterprise-logs-root";
    paths = [
      loki

      # Runtime utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "enterprise-logs-dirs" {} ''
        mkdir -p $out/etc/loki
        mkdir -p $out/var/loki
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${loki}/bin/loki" ];
    cmd = [ "-config.file=/etc/loki/config.yaml" ];
    workingDir = "/var/loki";
    exposedPorts = {
      "3100/tcp" = {};
      "9095/tcp" = {};
    };
    env = [
      "LOKI_PATH_PREFIX=/var/loki"
    ];
    labels = {
      "org.opencontainers.image.title" = "Enterprise Logs";
      "org.opencontainers.image.description" = "Grafana Enterprise Logs (Loki-based implementation)";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.note" = "Using Loki as open-source alternative to GEL";
    };
  };
}

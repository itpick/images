# grafana-enterprise-logs
# =============
# Grafana Enterprise Logs (GEL) - Enterprise logging solution
# https://grafana.com/docs/enterprise-logs/
#
# This is an alias/alternative name for enterprise-logs.
# Grafana Enterprise Logs is a commercial product from Grafana Labs.
#
# NOTE: This is a commercial product. Binaries are not publicly available.
# This implementation uses Loki as an open-source alternative.

{ nix2container, pkgs, lib, ... }:

let
  # Using Loki as the open-source alternative
  loki = pkgs.grafana-loki;
  version = loki.version;

in
nix2container.buildImage {
  name = "grafana-enterprise-logs";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "grafana-enterprise-logs-root";
    paths = [
      loki

      # Runtime utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "gel-dirs" {} ''
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
      "org.opencontainers.image.title" = "Grafana Enterprise Logs";
      "org.opencontainers.image.description" = "Grafana Enterprise Logs (Loki-based implementation)";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.note" = "Using Loki as open-source alternative to GEL";
    };
  };
}

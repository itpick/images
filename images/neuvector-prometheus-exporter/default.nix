# neuvector-prometheus-exporter
# =============
# NeuVector Prometheus Exporter - Metrics exporter for NeuVector
# https://github.com/neuvector/prometheus-exporter
#
# Exports NeuVector metrics in Prometheus format.
# This is a Python application.

{ nix2container, pkgs, lib, ... }:

let
  version = "1.1.0";

  pythonEnv = pkgs.python313.withPackages (ps: with ps; [
    prometheus-client
    requests
    packaging
  ]);

in
nix2container.buildImage {
  name = "neuvector-prometheus-exporter";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "neuvector-prometheus-exporter-root";
    paths = [
      pythonEnv

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "neuvector-exporter-dirs" {} ''
        mkdir -p $out/app
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/app" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pythonEnv}/bin/python" ];
    cmd = [ "/app/exporter.py" ];
    workingDir = "/app";
    exposedPorts = {
      "8068/tcp" = {};
    };
    env = [
      "EXPORTER_PORT=8068"
      "PYTHONUNBUFFERED=1"
    ];
    labels = {
      "org.opencontainers.image.title" = "NeuVector Prometheus Exporter";
      "org.opencontainers.image.description" = "Prometheus metrics exporter for NeuVector";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "neuvector";
    };
  };
}

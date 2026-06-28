{ mkImage, pkgs, lib, ... }:

# Prometheus JSON Exporter - Export JSON data as Prometheus metrics
# https://github.com/prometheus-community/json_exporter

let
  # json_exporter refuses to start without --config.file. Bake a minimal valid
  # default with one `default` module; the exporter only fetches a target JSON
  # when /probe is hit, so it needs no connection at startup. Operators mount
  # their own /etc/json_exporter/config.yml with real metric paths.
  jsonConfig = pkgs.writeTextDir "etc/json_exporter/config.yml" ''
    modules:
      default:
        metrics:
          - name: example_value
            path: '{ .value }'
  '';

in
mkImage {
  drv = pkgs.prometheus-json-exporter;
  name = "prometheus-json-exporter";
  tag = "v${pkgs.prometheus-json-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-json-exporter}/bin/json_exporter" ];
  # Was `--help` (a one-shot). Serve on 0.0.0.0:7979 with the baked config.
  cmd = [
    "--config.file=/etc/json_exporter/config.yml"
    "--web.listen-address=0.0.0.0:7979"
  ];

  extraPkgs = [ pkgs.cacert jsonConfig ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus JSON Exporter";
    "org.opencontainers.image.description" = "Export JSON data as Prometheus metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-json-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/prometheus-community/json_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "json-exporter,json_exporter,prometheus";
  };
}

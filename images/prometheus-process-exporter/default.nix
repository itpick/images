{ mkImage, pkgs, lib, ... }:

# Prometheus Process Exporter
# https://github.com/ncabatoff/process-exporter

let
  # process-exporter requires -config.path (or -procnames). Bake a default that
  # groups every process by its command name, so the image runs out of the box
  # and exposes per-process metrics for whatever is running. Operators mount
  # their own /etc/process-exporter/config.yml to scope it.
  procConfig = pkgs.writeTextDir "etc/process-exporter/config.yml" ''
    process_names:
      - name: "{{.Comm}}"
        cmdline:
          - '.+'
  '';

in
mkImage {
  drv = pkgs.prometheus-process-exporter;
  name = "prometheus-process-exporter";
  tag = "v${pkgs.prometheus-process-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-process-exporter}/bin/process-exporter" ];
  # Was `--help` (a one-shot). Serve /metrics on 0.0.0.0:9256 with the baked
  # config; it reads the local /proc, so no external connection is needed.
  cmd = [
    "-config.path=/etc/process-exporter/config.yml"
    "-web.listen-address=0.0.0.0:9256"
  ];

  extraPkgs = [ procConfig ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Process Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter that mines /proc to report on selected processes";
    "org.opencontainers.image.version" = pkgs.prometheus-process-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/ncabatoff/process-exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "process-exporter,prometheus";
  };
}

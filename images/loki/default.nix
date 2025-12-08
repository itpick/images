{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.grafana-loki;
  name = "loki";
  tag = pkgs.grafana-loki.version;
  entrypoint = [ "${pkgs.grafana-loki}/bin/loki" ];
  cmd = [ "--help" ];

  env = {
    LOKI_DATA_DIR = "/loki";
  };

  labels = {
    "org.opencontainers.image.title" = "Grafana Loki";
    "org.opencontainers.image.description" = "Like Prometheus but for logs";
    "org.opencontainers.image.version" = pkgs.grafana-loki.version;
    "io.nix-containers.chart" = "loki";
  };
}

{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.mimir;
  name = "mimir";
  tag = "v${pkgs.mimir.version}";
  entrypoint = [ "${pkgs.mimir}/bin/mimir" ];
  cmd = [ "-config.file=/etc/mimir/mimir.yaml" ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Mimir";
    "org.opencontainers.image.description" = "Scalable long-term storage for Prometheus";
    "org.opencontainers.image.version" = pkgs.mimir.version;
    "io.nix-containers.chart" = "mimir-distributed";
  };
}

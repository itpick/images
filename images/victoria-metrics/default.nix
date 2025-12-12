{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics - Time series database
# https://victoriametrics.com/

mkImage {
  drv = pkgs.victoriametrics;
  name = "victoria-metrics";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/victoria-metrics" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics";
    "org.opencontainers.image.description" = "Fast and scalable time series database";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
  };
}

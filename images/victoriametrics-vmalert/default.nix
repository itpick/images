{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmalert - alerting and recording rules executor
# https://docs.victoriametrics.com/vmalert/

mkImage {
  drv = pkgs.victoriametrics;
  name = "victoriametrics-vmalert";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/vmalert" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmalert";
    "org.opencontainers.image.description" = "Executes alerting and recording rules";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
    "io.nix-containers.chart" = "victoria-metrics-alert";
  };
}

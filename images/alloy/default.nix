{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.grafana-alloy;
  name = "alloy";
  tag = "v${pkgs.grafana-alloy.version}";
  entrypoint = [ "${pkgs.grafana-alloy}/bin/alloy" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Alloy";
    "org.opencontainers.image.description" = "OpenTelemetry Collector distribution with programmable pipelines";
    "org.opencontainers.image.version" = pkgs.grafana-alloy.version;
    "io.nix-containers.chart" = "alloy";
  };
}

{ mkImage, pkgs, lib, ... }:
mkImage {
  drv = pkgs.prometheus-nginx-exporter;
  name = "nginx-prometheus-exporter-nixchart";
  tag = "v${pkgs.prometheus-nginx-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-nginx-exporter}/bin/nginx-prometheus-exporter" ];
  cmd = [];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "nginx-prometheus-exporter-nixchart";
  labels."org.opencontainers.image.description" = "nginx prometheus exporter for the nix-containers charts/nginx chart";
  labels."org.opencontainers.image.version" = pkgs.prometheus-nginx-exporter.version;
  labels."io.nix-containers.chart" = "nginx";
}

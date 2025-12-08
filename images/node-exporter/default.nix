{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.prometheus-node-exporter;
  name = "node-exporter";
  tag = "v${pkgs.prometheus-node-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-node-exporter}/bin/node_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Node Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for hardware and OS metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-node-exporter.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.prometheus-pushgateway;
  name = "prometheus-pushgateway";
  tag = "v${pkgs.prometheus-pushgateway.version}";
  entrypoint = [ "${pkgs.prometheus-pushgateway}/bin/pushgateway" ];
  # Was empty (no command). Serve the push/metrics endpoint on 0.0.0.0:9091
  # (>1024, nonroot-bindable) so the prometheus-pushgateway / kind-test probe
  # can reach it. Pushgateway needs no config and holds pushed metrics in
  # memory; operators add --persistence.file for durability across restarts.
  cmd = [ "--web.listen-address=0.0.0.0:9091" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Pushgateway";
    "org.opencontainers.image.description" = "Allows ephemeral and batch jobs to expose metrics to Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-pushgateway.version;
    "io.nix-containers.chart" = "prometheus-pushgateway";
  };
}

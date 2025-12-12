{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vminsert - cluster component for accepting data
# https://docs.victoriametrics.com/cluster-victoriametrics/
# Uses custom package from pkgs/victoriametrics-cluster

let
  vm-cluster = pkgs.victoriametrics-cluster;
  version = vm-cluster.version;
in
mkImage {
  drv = vm-cluster.vminsert;
  name = "victoriametrics-vminsert";
  tag = "v${version}";
  entrypoint = [ "${vm-cluster.vminsert}/bin/vminsert" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vminsert";
    "org.opencontainers.image.description" = "Cluster component for accepting and distributing data";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-cluster";
  };
}

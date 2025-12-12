{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmstorage - cluster component for storing data
# https://docs.victoriametrics.com/cluster-victoriametrics/
# Uses custom package from pkgs/victoriametrics-cluster

let
  vm-cluster = pkgs.victoriametrics-cluster;
  version = vm-cluster.version;
in
mkImage {
  drv = vm-cluster.vmstorage;
  name = "victoriametrics-vmstorage";
  tag = "v${version}";
  entrypoint = [ "${vm-cluster.vmstorage}/bin/vmstorage" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmstorage";
    "org.opencontainers.image.description" = "Cluster component for storing time series data";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-cluster";
  };
}

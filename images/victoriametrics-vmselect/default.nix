{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmselect - cluster component for querying data
# https://docs.victoriametrics.com/cluster-victoriametrics/
# Uses custom package from pkgs/victoriametrics-cluster

let
  vm-cluster = pkgs.victoriametrics-cluster;
  version = vm-cluster.version;
in
mkImage {
  drv = vm-cluster.vmselect;
  name = "victoriametrics-vmselect";
  tag = "v${version}";
  entrypoint = [ "${vm-cluster.vmselect}/bin/vmselect" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmselect";
    "org.opencontainers.image.description" = "Cluster component for performing queries";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-cluster";
  };
}

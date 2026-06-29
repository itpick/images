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
  # Was empty (no command). vmstorage is the cluster storage node: serve the
  # HTTP API on 0.0.0.0:8482 (and accept vminsert/vmselect on its default
  # :8400/:8401, which already bind all interfaces) so the kind-test probe can
  # reach it, and keep -storageDataPath under the writable /tmp — the default
  # is relative to the read-only nix-store cwd. No config file is needed.
  # Operators mount a PVC and override -storageDataPath.
  cmd = [
    "-httpListenAddr=0.0.0.0:8482"
    "-storageDataPath=/tmp/vmstorage-data"
  ];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmstorage";
    "org.opencontainers.image.description" = "Cluster component for storing time series data";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-cluster";
  };
}

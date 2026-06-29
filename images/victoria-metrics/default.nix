{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics - Time series database
# https://victoriametrics.com/

mkImage {
  drv = pkgs.victoriametrics;
  name = "victoria-metrics";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/victoria-metrics" ];
  # Was `--help` (a one-shot). Run the single-node TSDB: serve the HTTP
  # API/UI on 0.0.0.0:8428 and keep the storage (the flock.lock + data dirs
  # noted below) under the writable /tmp mkImage provides — the default
  # -storageDataPath is relative to the cwd, which isn't writable. No config
  # file is needed. Operators mount a PVC and override -storageDataPath.
  cmd = [
    "-httpListenAddr=0.0.0.0:8428"
    "-storageDataPath=/tmp/victoria-metrics-data"
  ];

  # Match upstream's User (root) for drop-in PVC compatibility. The
  # upstream victoriametrics/victoria-metrics image runs as root and
  # writes a flock.lock + storage dirs owned by root. mkImage's default
  # User of 65534:65534 fails on the existing PVC:
  #
  #   FATAL: cannot create lock file "/<storageDataPath>/flock.lock":
  #          permission denied
  #
  # Operators that want non-root can still set fsGroup on the PodSpec.
  user = "0:0";

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics";
    "org.opencontainers.image.description" = "Fast and scalable time series database";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
  };
}

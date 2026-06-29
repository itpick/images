{ mkImage, pkgs, lib, ... }:

# VictoriaLogs - User friendly log database from VictoriaMetrics
# https://docs.victoriametrics.com/victorialogs/
# Uses pkgs.victorialogs (separate VictoriaLogs repo, not the core VM monorepo)

mkImage {
  drv = pkgs.victorialogs;
  name = "victoria-logs";
  tag = "v${pkgs.victorialogs.version}";
  entrypoint = [ "${pkgs.victorialogs}/bin/victoria-logs" ];
  # Was empty (no command). Mirror the sibling victoria-metrics completion:
  # serve the HTTP API/UI on 0.0.0.0:9428 and keep -storageDataPath (the
  # flock.lock + data dirs noted below) under the writable /tmp — the default
  # is relative to the read-only nix-store cwd. No config file is needed.
  # Operators mount a PVC and override -storageDataPath.
  cmd = [
    "-httpListenAddr=0.0.0.0:9428"
    "-storageDataPath=/tmp/victoria-logs-data"
  ];

  # Match upstream's User (root) so the image is drop-in compatible
  # with existing PVCs. The upstream victoriametrics/victoria-logs
  # image runs as root; its on-disk dirs (flock.lock, parts, indexdb,
  # etc.) are root-owned. mkImage's default User of 65534:65534 fails
  # to write the lock file:
  #
  #   FATAL: cannot create lock file "/victoria-logs-data/flock.lock":
  #          permission denied
  #
  # Operators that want non-root can still set fsGroup on the PodSpec.
  user = "0:0";

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaLogs";
    "org.opencontainers.image.description" = "Log management system from VictoriaMetrics";
    "org.opencontainers.image.version" = pkgs.victorialogs.version;
  };
}

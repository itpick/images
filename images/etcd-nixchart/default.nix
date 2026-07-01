{ mkImage, pkgs, lib, ... }:

# etcd-nixchart
# =============
# etcd image for consumption by the charts/etcd chart.
#
# etcd natively reads ETCD_* env vars for configuration
# (ETCD_ADVERTISE_CLIENT_URLS, ETCD_INITIAL_CLUSTER, etc.), so the
# image just runs the etcd binary — the chart's env-var block is the
# whole config path.
#
# Chart-specific env vars (ETCD_DISASTER_RECOVERY, ETCD_CLUSTER_DOMAIN,
# ETCD_INIT_SNAPSHOT_FILENAME) are Bitnami-specific and unsupported
# here — users needing them can layer their own init/args or use the
# upstream chart.

mkImage {
  drv = pkgs.etcd;
  name = "etcd-nixchart";
  tag = "v${pkgs.etcd.version}";

  entrypoint = [ (lib.getExe pkgs.etcd) ];
  cmd = [];

  user = "1001:0";

  # etcd's default data-dir is `default.etcd` (relative to cwd). CWD
  # isn't writable at UID 1001, so `docker run` and kind smoke tests
  # fail with "cannot access data directory: mkdir default.etcd:
  # permission denied". /tmp is 1777 in this image; anchor the default
  # there. Chart overrides via env.
  env = {
    ETCD_DATA_DIR = "/tmp/etcd-data";
  };

  labels = {
    "org.opencontainers.image.title" = "etcd-nixchart";
    "org.opencontainers.image.description" = "etcd image tuned for the nix-containers charts/etcd chart";
    "org.opencontainers.image.version" = pkgs.etcd.version;
    "io.nix-containers.chart" = "etcd";
  };
}

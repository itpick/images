{ mkImage, pkgs, lib, ... }:

# InfluxDB - Time series database
# https://www.influxdata.com/products/influxdb/

mkImage {
  drv = pkgs.influxdb;
  name = "influxdb";
  tag = "v${pkgs.influxdb.version}";
  entrypoint = [ "${pkgs.influxdb}/bin/influxd" ];
  # influxd (v1) runs with built-in defaults and binds the HTTP API on :8086
  # (all interfaces), so no command/config is needed — but its default
  # meta/data/wal dirs live under /var/lib/influxdb, which mkImage's nonroot
  # (65534) user can't write, so it CrashLoops. InfluxDB v1 maps these config
  # keys to env vars; point them at the writable /tmp (sticky 1777, so nobody
  # can create the subdirs). Operators mount a PVC and override these.
  cmd = [];

  env = {
    INFLUXDB_META_DIR = "/tmp/influxdb/meta";
    INFLUXDB_DATA_DIR = "/tmp/influxdb/data";
    INFLUXDB_DATA_WAL_DIR = "/tmp/influxdb/wal";
  };

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "InfluxDB";
    "org.opencontainers.image.description" = "Time series database for metrics, events, and analytics";
    "org.opencontainers.image.version" = pkgs.influxdb.version;
  };
}

{ mkImage, pkgs, lib, ... }:

# InfluxDB - Time series database
# https://www.influxdata.com/products/influxdb/

mkImage {
  drv = pkgs.influxdb;
  name = "influxdb";
  tag = "v${pkgs.influxdb.version}";
  entrypoint = [ "${pkgs.influxdb}/bin/influxd" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "InfluxDB";
    "org.opencontainers.image.description" = "Time series database for metrics, events, and analytics";
    "org.opencontainers.image.version" = pkgs.influxdb.version;
  };
}

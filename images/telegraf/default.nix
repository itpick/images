{ mkImage, pkgs, lib, ... }:

# Telegraf - Metrics collection agent
# https://www.influxdata.com/time-series-platform/telegraf/

mkImage {
  drv = pkgs.telegraf;
  name = "telegraf";
  tag = "v${pkgs.telegraf.version}";
  entrypoint = [ "${pkgs.telegraf}/bin/telegraf" ];
  cmd = [ "--config" "/etc/telegraf/telegraf.conf" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Telegraf";
    "org.opencontainers.image.description" = "Plugin-driven server agent for collecting and reporting metrics";
    "org.opencontainers.image.version" = pkgs.telegraf.version;
  };
}

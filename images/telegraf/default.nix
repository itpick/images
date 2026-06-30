{ mkImage, pkgs, lib, ... }:

# Telegraf - Metrics collection agent
# https://www.influxdata.com/time-series-platform/telegraf/

let
  # The cmd points --config at /etc/telegraf/telegraf.conf, but the nixpkgs
  # package ships no config there and nothing baked it — Telegraf exits ("no
  # config file specified"/"unknown config"). Bake a minimal config (the Go
  # binary ships no /etc, so no shadowing): collect Telegraf's own `internal`
  # metrics and expose them via the `prometheus_client` output on 0.0.0.0:9273.
  # No writable dir needed. Operators mount their own config with real
  # inputs/outputs.
  telegrafConfig = pkgs.writeTextDir "etc/telegraf/telegraf.conf" ''
    [agent]
      interval = "10s"
      flush_interval = "10s"

    [[inputs.internal]]

    [[outputs.prometheus_client]]
      listen = ":9273"
  '';

in
mkImage {
  drv = pkgs.telegraf;
  name = "telegraf";
  tag = "v${pkgs.telegraf.version}";
  entrypoint = [ "${pkgs.telegraf}/bin/telegraf" ];
  cmd = [ "--config" "/etc/telegraf/telegraf.conf" ];

  extraPkgs = with pkgs; [ cacert telegrafConfig ];

  labels = {
    "org.opencontainers.image.title" = "Telegraf";
    "org.opencontainers.image.description" = "Plugin-driven server agent for collecting and reporting metrics";
    "org.opencontainers.image.version" = pkgs.telegraf.version;
  };
}

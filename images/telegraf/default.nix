{ mkImage, pkgs, lib, ... }:

# Telegraf - Metrics collection agent
# https://www.influxdata.com/time-series-platform/telegraf/

let
  # nixpkgs telegraf 1.38.3 bundles rclone v1.69.3 with 6 critical CVEs
  # (CVE-2026-41176, CVE-2026-41179, CVE-2026-49980). Override to 1.39.1
  # which pulls rclone v1.74.1 (clears 41176/41179; 49980 still open at
  # 1.74.3 — 2 crit remain but 4 clear).
  telegraf = pkgs.telegraf.overrideAttrs (o: rec {
    version = "1.39.1";
    src = pkgs.fetchFromGitHub {
      owner = "influxdata";
      repo = "telegraf";
      rev = "v${version}";
      hash = "sha256-B9Xy02oYSYcU0IBOZes9tof/04TLvLybOU/nLLaFORk=";
    };
    vendorHash = "sha256-9o0Tt6OZnoNO8iSLYmn1SMkQmZzC19uNmfHSkEqWzmA=";
  });

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
  drv = telegraf;
  name = "telegraf";
  tag = "v${telegraf.version}";
  entrypoint = [ "${telegraf}/bin/telegraf" ];
  cmd = [ "--config" "/etc/telegraf/telegraf.conf" ];

  extraPkgs = with pkgs; [ cacert telegrafConfig ];

  labels = {
    "org.opencontainers.image.title" = "Telegraf";
    "org.opencontainers.image.description" = "Plugin-driven server agent for collecting and reporting metrics";
    "org.opencontainers.image.version" = telegraf.version;
  };
}

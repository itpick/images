{ mkImage, pkgs, lib, ... }:

# Karma - Alert dashboard for Prometheus Alertmanager
# https://github.com/prymitive/karma

mkImage {
  drv = pkgs.karma;
  name = "karma";
  tag = "v${pkgs.karma.version}";
  entrypoint = [ "${pkgs.karma}/bin/karma" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the
  # dashboard: karma needs at least one Alertmanager configured, so use the
  # simplified single-AM config pointing at the conventional :9093 (operators
  # override --alertmanager.uri with their real Alertmanager). karma logs the
  # connection errors but stays up and serves the web UI, and --listen.address
  # 0.0.0.0 binds all interfaces on :8080 so the kind-test probe can reach it.
  # karma is stateless (no data dir needed).
  cmd = [
    "--alertmanager.uri" "http://localhost:9093"
    "--alertmanager.name" "default"
    "--listen.address" "0.0.0.0"
  ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Karma";
    "org.opencontainers.image.description" = "Alert dashboard for Prometheus Alertmanager";
    "org.opencontainers.image.version" = pkgs.karma.version;
  };
}

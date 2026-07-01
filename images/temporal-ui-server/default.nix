{ mkImage, pkgs, lib, ... }:

# Temporal UI Server - Web UI for Temporal
# https://temporal.io/

let
  # temporal-ui-server loads its config from <root>/config/<env>.yaml and exits
  # without one ("config file corrupted: no config files found"). Bake a minimal
  # development.yaml (the Go binary ships no /etc, so no shadowing): serve the UI
  # on 0.0.0.0:8080 and point at a placeholder Temporal frontend. The UI server
  # starts and serves even though that frontend isn't reachable (it just shows a
  # connection error), so the image is self-contained. TEMPORAL_ROOT (below)
  # points the loader at this baked config; operators mount their own config
  # with their real temporalGrpcAddress.
  uiConfig = pkgs.writeTextDir "etc/temporal-ui-server/config/development.yaml" ''
    temporalGrpcAddress: 127.0.0.1:7233
    host: 0.0.0.0
    port: 8080
    enableUi: true
  '';
in
mkImage {
  drv = pkgs.temporal-ui-server;
  name = "temporal-ui-server";
  tag = "v${pkgs.temporal-ui-server.version}";
  entrypoint = [ "${pkgs.temporal-ui-server}/bin/temporal-ui-server" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the web UI
  # server; TEMPORAL_ROOT (below) tells it where the baked config lives.
  cmd = [ "start" ];

  env = {
    TEMPORAL_ROOT = "/etc/temporal-ui-server";
  };

  extraPkgs = with pkgs; [ cacert uiConfig ];

  labels = {
    "org.opencontainers.image.title" = "Temporal UI Server";
    "org.opencontainers.image.description" = "Web interface for Temporal workflow orchestration";
    "org.opencontainers.image.version" = pkgs.temporal-ui-server.version;
  };
}

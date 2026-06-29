{ mkImage, pkgs, lib, ... }:

# promtail - Log collector for Loki
# https://grafana.com/docs/loki/latest/clients/promtail/

let
  # Promtail needs a config to run. Bake a minimal one at /etc/promtail/config.yaml
  # (the Go binary ships no /etc, so no shadowing): the HTTP server on
  # 0.0.0.0:9080, the positions file under the writable /tmp, no scrape targets,
  # and a single (placeholder) Loki client — promtail only connects to push, so
  # with no scrape targets the unreachable localhost client is never dialed; it
  # just keeps the config valid. Operators mount their own config (real clients
  # + scrape_configs).
  promtailConfig = pkgs.writeTextDir "etc/promtail/config.yaml" ''
    server:
      http_listen_address: 0.0.0.0
      http_listen_port: 9080
      grpc_listen_port: 0

    positions:
      filename: /tmp/positions.yaml

    clients:
      - url: http://localhost:3100/loki/api/v1/push

    scrape_configs: []
  '';

in
mkImage {
  drv = pkgs.promtail;
  name = "promtail";
  tag = "v${pkgs.promtail.version}";
  entrypoint = [ "${pkgs.promtail}/bin/promtail" ];
  # Was `--help` (a one-shot). Run the agent with the baked config; it serves
  # the HTTP API on 0.0.0.0:9080 so the kind-test probe can reach it.
  cmd = [ "-config.file=/etc/promtail/config.yaml" ];

  extraPkgs = with pkgs; [ cacert promtailConfig ];

  labels = {
    "org.opencontainers.image.title" = "promtail";
    "org.opencontainers.image.description" = "Agent for collecting logs and sending them to Loki";
    "org.opencontainers.image.version" = pkgs.promtail.version;
  };
}

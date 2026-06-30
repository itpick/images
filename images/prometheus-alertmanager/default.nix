# prometheus-alertmanager
# =============
# Prometheus Alertmanager - Alert handling for Prometheus
# https://prometheus.io/docs/alerting/alertmanager/
#
# Alertmanager handles alerts sent by Prometheus, taking care of
# deduplicating, grouping, routing, silencing, and inhibition.

{ mkImage, pkgs, lib, ... }:

let
  # The cmd points --config.file at /etc/alertmanager/alertmanager.yml, but
  # nothing baked that file — Alertmanager refuses to start without a config.
  # Bake a minimal valid config (a catch-all route to a no-op 'null' receiver)
  # there (the Go binary ships no /etc, so no shadowing). Mirrors the validated
  # sibling `alertmanager` image.
  alertmanagerConfig = pkgs.writeTextDir "etc/alertmanager/alertmanager.yml" ''
    route:
      receiver: 'null'
    receivers:
      - name: 'null'
  '';

in
mkImage {
  drv = pkgs.prometheus-alertmanager;
  name = "prometheus-alertmanager";
  tag = "v${pkgs.prometheus-alertmanager.version}";
  entrypoint = [ "${pkgs.prometheus-alertmanager}/bin/alertmanager" ];
  # The bare image only passed --config.file (which wasn't baked) and used the
  # default storage path (data/, relative to the read-only cwd). Bake the config
  # above, keep the silences/nflog storage under the writable /tmp, and bind the
  # web API to 0.0.0.0:9093 so the kind-test probe can reach it.
  cmd = [
    "--config.file=/etc/alertmanager/alertmanager.yml"
    "--storage.path=/tmp/alertmanager"
    "--web.listen-address=0.0.0.0:9093"
  ];

  extraPkgs = with pkgs; [ cacert alertmanagerConfig ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Alertmanager";
    "org.opencontainers.image.description" = "Alert handling for Prometheus monitoring";
    "org.opencontainers.image.version" = pkgs.prometheus-alertmanager.version;
  };
}

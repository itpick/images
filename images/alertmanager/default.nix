{ mkImage, pkgs, lib, ... }:

let
  # Alertmanager refuses to start without a config file (it defaults to
  # ./alertmanager.yml in the cwd, which doesn't exist in the image). Bake a
  # minimal valid config — a single catch-all route to a no-op 'null' receiver —
  # at /etc/alertmanager/alertmanager.yml (the Go binary ships no /etc, so no
  # shadowing). Operators mount their own config with real receivers/routes.
  alertmanagerConfig = pkgs.writeTextDir "etc/alertmanager/alertmanager.yml" ''
    route:
      receiver: 'null'
    receivers:
      - name: 'null'
  '';

in
mkImage {
  drv = pkgs.prometheus-alertmanager;
  name = "alertmanager";
  tag = "v${pkgs.prometheus-alertmanager.version}";
  entrypoint = [ "${pkgs.prometheus-alertmanager}/bin/alertmanager" ];
  # Was `--help` (a one-shot). Run the server with the baked config, bind the
  # web UI/API to 0.0.0.0:9093 so the kube-prometheus-stack / kind-test probe
  # can reach it, and keep the notification-log/silences storage under the
  # writable /tmp mkImage provides.
  cmd = [
    "--config.file=/etc/alertmanager/alertmanager.yml"
    "--storage.path=/tmp/alertmanager"
    "--web.listen-address=0.0.0.0:9093"
  ];

  extraPkgs = [ alertmanagerConfig ];

  env = {
    ALERTMANAGER_DATA_DIR = "/alertmanager";
  };

  labels = {
    "org.opencontainers.image.title" = "Alertmanager";
    "org.opencontainers.image.description" = "Prometheus Alertmanager handles alerts sent by Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-alertmanager.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}

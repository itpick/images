{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.grafana;
  name = "grafana";
  tag = pkgs.grafana.version;
  entrypoint = [ "${pkgs.grafana}/bin/grafana" ];
  cmd = [ "server" "--homepath" "${pkgs.grafana}/share/grafana" ];

  # Grafana's data (the SQLite DB), logs and plugins dirs must be writable, but
  # the defaults /var/lib/grafana + /var/log/grafana aren't writable by the
  # nonroot user on the read-only root — grafana CrashLoops creating grafana.db.
  # Point them at the writable /tmp (grafana auto-creates the subdirs). Operators
  # mount a PVC and override GF_PATHS_DATA. (GF_PATHS_PROVISIONING stays at the
  # conventional /etc path — a missing provisioning dir is non-fatal; operators
  # mount their datasource/dashboard provisioning there.)
  env = {
    GF_PATHS_DATA = "/tmp/grafana/data";
    GF_PATHS_LOGS = "/tmp/grafana/logs";
    GF_PATHS_PLUGINS = "/tmp/grafana/plugins";
    GF_PATHS_PROVISIONING = "/etc/grafana/provisioning";
  };

  labels = {
    "org.opencontainers.image.title" = "Grafana";
    "org.opencontainers.image.description" = "Open source analytics and monitoring solution";
    "org.opencontainers.image.version" = pkgs.grafana.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}

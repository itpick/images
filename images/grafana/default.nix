{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.grafana;
  name = "grafana";
  tag = pkgs.grafana.version;
  entrypoint = [ "${pkgs.grafana}/bin/grafana" ];
  cmd = [ "server" "--homepath" "${pkgs.grafana}/share/grafana" ];

  env = {
    GF_PATHS_DATA = "/var/lib/grafana";
    GF_PATHS_LOGS = "/var/log/grafana";
    GF_PATHS_PLUGINS = "/var/lib/grafana/plugins";
    GF_PATHS_PROVISIONING = "/etc/grafana/provisioning";
  };

  labels = {
    "org.opencontainers.image.title" = "Grafana";
    "org.opencontainers.image.description" = "Open source analytics and monitoring solution";
    "org.opencontainers.image.version" = pkgs.grafana.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}

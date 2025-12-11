{ mkImage, pkgs, lib, ... }:

# promtail - Log collector for Loki
# https://grafana.com/docs/loki/latest/clients/promtail/

mkImage {
  drv = pkgs.promtail;
  name = "promtail";
  tag = "v${pkgs.promtail.version}";
  entrypoint = [ "${pkgs.promtail}/bin/promtail" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "promtail";
    "org.opencontainers.image.description" = "Agent for collecting logs and sending them to Loki";
    "org.opencontainers.image.version" = pkgs.promtail.version;
  };
}

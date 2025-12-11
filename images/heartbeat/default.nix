{ mkImage, pkgs, lib, ... }:

# Heartbeat - Lightweight uptime monitoring
# https://www.elastic.co/beats/heartbeat

mkImage {
  drv = pkgs.heartbeat;
  name = "heartbeat";
  tag = "v${pkgs.heartbeat.version}";
  entrypoint = [ "${pkgs.heartbeat}/bin/heartbeat" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Heartbeat";
    "org.opencontainers.image.description" = "Lightweight shipper for uptime monitoring";
    "org.opencontainers.image.version" = pkgs.heartbeat.version;
  };
}

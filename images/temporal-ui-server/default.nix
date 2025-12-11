{ mkImage, pkgs, lib, ... }:

# Temporal UI Server - Web UI for Temporal
# https://temporal.io/

mkImage {
  drv = pkgs.temporal-ui-server;
  name = "temporal-ui-server";
  tag = "v${pkgs.temporal-ui-server.version}";
  entrypoint = [ "${pkgs.temporal-ui-server}/bin/temporal-ui-server" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Temporal UI Server";
    "org.opencontainers.image.description" = "Web interface for Temporal workflow orchestration";
    "org.opencontainers.image.version" = pkgs.temporal-ui-server.version;
  };
}

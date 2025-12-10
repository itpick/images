{ mkImage, pkgs, lib, ... }:

# Hubble UI Backend - Backend service for Hubble UI
# https://github.com/cilium/hubble-ui

mkImage {
  drv = pkgs.hubble-ui.hubble-ui-backend;
  name = "hubble-ui-backend";
  tag = "v${pkgs.hubble-ui.version}";
  entrypoint = [ "${pkgs.hubble-ui.hubble-ui-backend}/bin/backend" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Hubble UI Backend";
    "org.opencontainers.image.description" = "Backend service for Hubble UI web interface";
    "org.opencontainers.image.version" = pkgs.hubble-ui.version;
    "io.nix-containers.chart" = "cilium";
  };
}

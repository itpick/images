{ mkImage, pkgs, lib, ... }:

# Hubble Relay - Aggregates flow data from Hubble peers
# https://github.com/cilium/cilium

mkImage {
  drv = pkgs.cilium.hubble-relay;
  name = "hubble-relay";
  tag = "v${pkgs.cilium.version}";
  entrypoint = [ "${pkgs.cilium.hubble-relay}/bin/hubble-relay" ];
  cmd = [ "serve" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Hubble Relay";
    "org.opencontainers.image.description" = "Aggregates network flow data from Hubble peers";
    "org.opencontainers.image.version" = pkgs.cilium.version;
    "io.nix-containers.chart" = "cilium";
  };
}

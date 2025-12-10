{ mkImage, pkgs, lib, ... }:

# Hubble Certgen - Certificate generator for Hubble and Cilium
# https://github.com/cilium/certgen

mkImage {
  drv = pkgs.cilium-certgen;
  name = "hubble-certgen";
  tag = "v${pkgs.cilium-certgen.version}";
  entrypoint = [ "${pkgs.cilium-certgen}/bin/certgen" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Hubble Certgen";
    "org.opencontainers.image.description" = "Certificate generator for Hubble and Cilium";
    "org.opencontainers.image.version" = pkgs.cilium-certgen.version;
    "io.nix-containers.chart" = "cilium";
  };
}

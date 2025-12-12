{ mkImage, pkgs, lib, ... }:

# SPIRE - SPIFFE Runtime Environment
# https://spiffe.io/spire/

mkImage {
  drv = pkgs.spire;
  name = "spire";
  tag = "v${pkgs.spire.version}";
  entrypoint = [ "${pkgs.spire}/bin/spire-server" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "SPIRE";
    "org.opencontainers.image.description" = "SPIFFE Runtime Environment";
    "org.opencontainers.image.version" = pkgs.spire.version;
  };
}

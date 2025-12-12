{ mkImage, pkgs, lib, ... }:

# Packer - Machine image builder
# https://www.packer.io/

mkImage {
  drv = pkgs.packer;
  name = "packer";
  tag = "v${pkgs.packer.version}";
  entrypoint = [ "${pkgs.packer}/bin/packer" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Packer";
    "org.opencontainers.image.description" = "Machine image builder";
    "org.opencontainers.image.version" = pkgs.packer.version;
  };
}

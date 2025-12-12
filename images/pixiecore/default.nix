{ mkImage, pkgs, lib, ... }:

# Pixiecore - PXE booting server
# https://github.com/danderson/netboot

mkImage {
  drv = pkgs.pixiecore;
  name = "pixiecore";
  tag = "v${pkgs.pixiecore.version}";
  entrypoint = [ "${pkgs.pixiecore}/bin/pixiecore" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Pixiecore";
    "org.opencontainers.image.description" = "PXE booting server";
    "org.opencontainers.image.version" = pkgs.pixiecore.version;
  };
}

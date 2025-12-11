{ mkImage, pkgs, lib, ... }:

# dfc - Display file system space usage using graphs and colors
# https://github.com/Rolinh/dfc

mkImage {
  drv = pkgs.dfc;
  name = "dfc";
  tag = "v${pkgs.dfc.version}";
  entrypoint = [ "${pkgs.dfc}/bin/dfc" ];
  cmd = [ "-h" ];

  labels = {
    "org.opencontainers.image.title" = "dfc";
    "org.opencontainers.image.description" = "Display file system space usage using graphs and colors";
    "org.opencontainers.image.version" = pkgs.dfc.version;
  };
}

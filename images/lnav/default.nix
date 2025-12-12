{ mkImage, pkgs, lib, ... }:

# lnav - Log file navigator
# https://lnav.org/

mkImage {
  drv = pkgs.lnav;
  name = "lnav";
  tag = "v${pkgs.lnav.version}";
  entrypoint = [ "${pkgs.lnav}/bin/lnav" ];
  cmd = [ "-h" ];

  labels = {
    "org.opencontainers.image.title" = "lnav";
    "org.opencontainers.image.description" = "Advanced log file viewer for small-scale";
    "org.opencontainers.image.version" = pkgs.lnav.version;
  };
}

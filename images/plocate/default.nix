{ mkImage, pkgs, lib, ... }:

# plocate - Fast file locate
# https://plocate.sesse.net/

mkImage {
  drv = pkgs.plocate;
  name = "plocate";
  tag = "v${pkgs.plocate.version}";
  entrypoint = [ "${pkgs.plocate}/bin/plocate" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "plocate";
    "org.opencontainers.image.description" = "Fast file locate using posting lists";
    "org.opencontainers.image.version" = pkgs.plocate.version;
  };
}

{ mkImage, pkgs, lib, ... }:

# Readarr - Book collection manager
# https://readarr.com/

mkImage {
  drv = pkgs.readarr;
  name = "readarr";
  tag = "v${pkgs.readarr.version}";
  entrypoint = [ "${pkgs.readarr}/bin/Readarr" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Readarr";
    "org.opencontainers.image.description" = "Book collection manager";
    "org.opencontainers.image.version" = pkgs.readarr.version;
  };
}

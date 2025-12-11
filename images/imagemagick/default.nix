{ mkImage, pkgs, lib, ... }:

# ImageMagick - Image manipulation toolkit
# https://imagemagick.org/

mkImage {
  drv = pkgs.imagemagick;
  name = "imagemagick";
  tag = "v${pkgs.imagemagick.version}";
  entrypoint = [ "${pkgs.imagemagick}/bin/convert" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "ImageMagick";
    "org.opencontainers.image.description" = "Software suite to create, edit, and compose bitmap images";
    "org.opencontainers.image.version" = pkgs.imagemagick.version;
  };
}

{ mkImage, pkgs, lib, ... }:

# GraphicsMagick - Image processing toolkit
# http://www.graphicsmagick.org/

mkImage {
  drv = pkgs.graphicsmagick;
  name = "graphicsmagick";
  tag = "v${pkgs.graphicsmagick.version}";
  entrypoint = [ "${pkgs.graphicsmagick}/bin/gm" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "GraphicsMagick";
    "org.opencontainers.image.description" = "Swiss army knife of image processing";
    "org.opencontainers.image.version" = pkgs.graphicsmagick.version;
  };
}

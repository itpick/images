{ mkImage, pkgs, lib, ... }:

# OpenCV - Computer vision library
# https://opencv.org/

mkImage {
  drv = pkgs.opencv;
  name = "opencv";
  tag = "v${pkgs.opencv.version}";
  entrypoint = [ "${pkgs.opencv}/bin/opencv_version" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "OpenCV";
    "org.opencontainers.image.description" = "Open Source Computer Vision Library";
    "org.opencontainers.image.version" = pkgs.opencv.version;
  };
}

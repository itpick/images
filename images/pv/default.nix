{ mkImage, pkgs, lib, ... }:

# pv - Pipe Viewer
# http://www.ivarch.com/programs/pv.shtml

mkImage {
  drv = pkgs.pv;
  name = "pv";
  tag = "v${pkgs.pv.version}";
  entrypoint = [ "${pkgs.pv}/bin/pv" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "pv";
    "org.opencontainers.image.description" = "Monitor progress of data through a pipeline";
    "org.opencontainers.image.version" = pkgs.pv.version;
  };
}

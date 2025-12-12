{ mkImage, pkgs, lib, ... }:

# nnn - Terminal file manager
# https://github.com/jarun/nnn

mkImage {
  drv = pkgs.nnn;
  name = "nnn";
  tag = "v${pkgs.nnn.version}";
  entrypoint = [ "${pkgs.nnn}/bin/nnn" ];
  cmd = [ "-V" ];

  labels = {
    "org.opencontainers.image.title" = "nnn";
    "org.opencontainers.image.description" = "Terminal file manager with keyboard shortcuts";
    "org.opencontainers.image.version" = pkgs.nnn.version;
  };
}

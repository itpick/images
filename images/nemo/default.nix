{ mkImage, pkgs, lib, ... }:

# Nemo - File manager for Cinnamon desktop
# https://github.com/linuxmint/nemo

mkImage {
  drv = pkgs.nemo;
  name = "nemo";
  tag = "v${pkgs.nemo.version}";
  entrypoint = [ "${pkgs.nemo}/bin/nemo" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Nemo";
    "org.opencontainers.image.description" = "File manager for Cinnamon desktop";
    "org.opencontainers.image.version" = pkgs.nemo.version;
  };
}

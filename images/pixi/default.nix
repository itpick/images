{ mkImage, pkgs, lib, ... }:

# Pixi - Fast software package manager
# https://prefix.dev/

mkImage {
  drv = pkgs.pixi;
  name = "pixi";
  tag = "v${pkgs.pixi.version}";
  entrypoint = [ "${pkgs.pixi}/bin/pixi" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "Pixi";
    "org.opencontainers.image.description" = "Fast software package manager built on conda ecosystem";
    "org.opencontainers.image.version" = pkgs.pixi.version;
  };
}

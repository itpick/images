{ mkImage, pkgs, lib, ... }:

# mcfly - Shell history search
# https://github.com/cantino/mcfly

mkImage {
  drv = pkgs.mcfly;
  name = "mcfly";
  tag = "v${pkgs.mcfly.version}";
  entrypoint = [ "${pkgs.mcfly}/bin/mcfly" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "mcfly";
    "org.opencontainers.image.description" = "Fly through shell history with smart search";
    "org.opencontainers.image.version" = pkgs.mcfly.version;
  };
}

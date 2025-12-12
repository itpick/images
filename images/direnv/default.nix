{ mkImage, pkgs, lib, ... }:

# direnv - Environment switcher
# https://direnv.net/

mkImage {
  drv = pkgs.direnv;
  name = "direnv";
  tag = "v${pkgs.direnv.version}";
  entrypoint = [ "${pkgs.direnv}/bin/direnv" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "direnv";
    "org.opencontainers.image.description" = "Environment switcher for the shell";
    "org.opencontainers.image.version" = pkgs.direnv.version;
  };
}

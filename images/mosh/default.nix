{ mkImage, pkgs, lib, ... }:

# Mosh - Mobile shell
# https://mosh.org/

mkImage {
  drv = pkgs.mosh;
  name = "mosh";
  tag = "v${pkgs.mosh.version}";
  entrypoint = [ "${pkgs.mosh}/bin/mosh" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "Mosh";
    "org.opencontainers.image.description" = "Mobile shell with roaming and local echo";
    "org.opencontainers.image.version" = pkgs.mosh.version;
  };
}

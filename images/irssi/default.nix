{ mkImage, pkgs, lib, ... }:

# Irssi - Terminal IRC client
# https://irssi.org/

mkImage {
  drv = pkgs.irssi;
  name = "irssi";
  tag = "v${pkgs.irssi.version}";
  entrypoint = [ "${pkgs.irssi}/bin/irssi" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "Irssi";
    "org.opencontainers.image.description" = "Terminal-based IRC client";
    "org.opencontainers.image.version" = pkgs.irssi.version;
  };
}

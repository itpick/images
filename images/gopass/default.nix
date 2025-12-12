{ mkImage, pkgs, lib, ... }:

# gopass - Password manager
# https://www.gopass.pw/

mkImage {
  drv = pkgs.gopass;
  name = "gopass";
  tag = "v${pkgs.gopass.version}";
  entrypoint = [ "${pkgs.gopass}/bin/gopass" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "gopass";
    "org.opencontainers.image.description" = "Team password manager based on pass";
    "org.opencontainers.image.version" = pkgs.gopass.version;
  };
}

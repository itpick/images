{ mkImage, pkgs, lib, ... }:

# Teleport - Secure infrastructure access
# https://goteleport.com/

mkImage {
  drv = pkgs.teleport;
  name = "teleport";
  tag = "v${pkgs.teleport.version}";
  entrypoint = [ "${pkgs.teleport}/bin/teleport" ];
  cmd = [ "start" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Teleport";
    "org.opencontainers.image.description" = "Modern SSH server for managing access to clusters";
    "org.opencontainers.image.version" = pkgs.teleport.version;
  };
}

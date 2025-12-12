{ mkImage, pkgs, lib, ... }:

# Starship - Cross-shell prompt
# https://starship.rs/

mkImage {
  drv = pkgs.starship;
  name = "starship";
  tag = "v${pkgs.starship.version}";
  entrypoint = [ "${pkgs.starship}/bin/starship" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Starship";
    "org.opencontainers.image.description" = "Minimal, blazing fast shell prompt";
    "org.opencontainers.image.version" = pkgs.starship.version;
  };
}

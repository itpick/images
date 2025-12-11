{ mkImage, pkgs, lib, ... }:

# deck - Kong declarative configuration management
# https://github.com/Kong/deck

mkImage {
  drv = pkgs.deck;
  name = "deck";
  tag = "v${pkgs.deck.version}";
  entrypoint = [ "${pkgs.deck}/bin/deck" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "deck";
    "org.opencontainers.image.description" = "Declarative configuration for Kong";
    "org.opencontainers.image.version" = pkgs.deck.version;
  };
}

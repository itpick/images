{ mkImage, pkgs, lib, ... }:

# deck-fips
# Container image packaging nixpkgs.deck
mkImage {
  drv = pkgs.deck;
  name = "deck-fips";
  tag = "v${pkgs.deck.version}";
  entrypoint = [ (lib.getExe pkgs.deck) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "deck-fips";
    "org.opencontainers.image.description" = "deck-fips container image (nixpkgs.deck)";
    "org.opencontainers.image.version" = pkgs.deck.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# nixpkgs-fmt - Nix code formatter
# https://github.com/nix-community/nixpkgs-fmt

mkImage {
  drv = pkgs.nixpkgs-fmt;
  name = "nixpkgs-fmt";
  tag = "v${pkgs.nixpkgs-fmt.version}";
  entrypoint = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nixpkgs-fmt";
    "org.opencontainers.image.description" = "Nix code formatter for nixpkgs";
    "org.opencontainers.image.version" = pkgs.nixpkgs-fmt.version;
  };
}

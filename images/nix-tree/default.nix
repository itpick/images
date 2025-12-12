{ mkImage, pkgs, lib, ... }:

# nix-tree - Nix store path explorer
# https://github.com/utdemir/nix-tree

mkImage {
  drv = pkgs.nix-tree;
  name = "nix-tree";
  tag = "v${pkgs.nix-tree.version}";
  entrypoint = [ "${pkgs.nix-tree}/bin/nix-tree" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nix-tree";
    "org.opencontainers.image.description" = "Interactively browse Nix store paths";
    "org.opencontainers.image.version" = pkgs.nix-tree.version;
  };
}

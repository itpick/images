{ mkImage, pkgs, lib, ... }:

# Neovim - Vim fork focused on extensibility
# https://neovim.io/

mkImage {
  drv = pkgs.neovim;
  name = "neovim";
  tag = "v${pkgs.neovim.version}";
  entrypoint = [ "${pkgs.neovim}/bin/nvim" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Neovim";
    "org.opencontainers.image.description" = "Vim fork focused on extensibility and agility";
    "org.opencontainers.image.version" = pkgs.neovim.version;
  };
}

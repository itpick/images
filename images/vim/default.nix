{ mkImage, pkgs, lib, ... }:

# Vim - Text editor
# https://www.vim.org/

mkImage {
  drv = pkgs.vim;
  name = "vim";
  tag = "v${pkgs.vim.version}";
  entrypoint = [ "${pkgs.vim}/bin/vim" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Vim";
    "org.opencontainers.image.description" = "Most popular clone of the VI editor";
    "org.opencontainers.image.version" = pkgs.vim.version;
  };
}

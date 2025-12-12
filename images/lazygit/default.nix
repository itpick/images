{ mkImage, pkgs, lib, ... }:

# lazygit - Terminal UI for git
# https://github.com/jesseduffield/lazygit

mkImage {
  drv = pkgs.lazygit;
  name = "lazygit";
  tag = "v${pkgs.lazygit.version}";
  entrypoint = [ "${pkgs.lazygit}/bin/lazygit" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "lazygit";
    "org.opencontainers.image.description" = "Simple terminal UI for git commands";
    "org.opencontainers.image.version" = pkgs.lazygit.version;
  };
}

{ mkImage, pkgs, lib, ... }:

# gitui - Terminal UI for Git
# https://github.com/extrawurst/gitui

mkImage {
  drv = pkgs.gitui;
  name = "gitui";
  tag = "v${pkgs.gitui.version}";
  entrypoint = [ "${pkgs.gitui}/bin/gitui" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gitui";
    "org.opencontainers.image.description" = "Blazing fast terminal-ui for Git";
    "org.opencontainers.image.version" = pkgs.gitui.version;
  };
}

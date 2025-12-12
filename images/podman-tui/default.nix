{ mkImage, pkgs, lib, ... }:

# Podman TUI - Terminal UI for Podman
# https://github.com/containers/podman-tui

mkImage {
  drv = pkgs.podman-tui;
  name = "podman-tui";
  tag = "v${pkgs.podman-tui.version}";
  entrypoint = [ "${pkgs.podman-tui}/bin/podman-tui" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Podman TUI";
    "org.opencontainers.image.description" = "Terminal UI for Podman";
    "org.opencontainers.image.version" = pkgs.podman-tui.version;
  };
}

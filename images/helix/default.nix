{ mkImage, pkgs, lib, ... }:

# Helix - Post-modern modal text editor
# https://helix-editor.com/

mkImage {
  drv = pkgs.helix;
  name = "helix";
  tag = "v${pkgs.helix.version}";
  entrypoint = [ "${pkgs.helix}/bin/hx" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Helix";
    "org.opencontainers.image.description" = "Post-modern modal text editor";
    "org.opencontainers.image.version" = pkgs.helix.version;
  };
}

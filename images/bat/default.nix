{ mkImage, pkgs, lib, ... }:

# bat - A cat clone with syntax highlighting
# https://github.com/sharkdp/bat

mkImage {
  drv = pkgs.bat;
  name = "bat";
  tag = "v${pkgs.bat.version}";
  entrypoint = [ "${pkgs.bat}/bin/bat" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "bat";
    "org.opencontainers.image.description" = "Cat clone with syntax highlighting and Git integration";
    "org.opencontainers.image.version" = pkgs.bat.version;
  };
}

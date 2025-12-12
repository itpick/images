{ mkImage, pkgs, lib, ... }:

# eza - Modern replacement for ls
# https://eza.rocks/

mkImage {
  drv = pkgs.eza;
  name = "eza";
  tag = "v${pkgs.eza.version}";
  entrypoint = [ "${pkgs.eza}/bin/eza" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "eza";
    "org.opencontainers.image.description" = "Modern, maintained replacement for ls";
    "org.opencontainers.image.version" = pkgs.eza.version;
  };
}

{ mkImage, pkgs, lib, ... }:

# lsd - Modern ls replacement
# https://github.com/lsd-rs/lsd

mkImage {
  drv = pkgs.lsd;
  name = "lsd";
  tag = "v${pkgs.lsd.version}";
  entrypoint = [ "${pkgs.lsd}/bin/lsd" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "lsd";
    "org.opencontainers.image.description" = "Next-gen ls command with colors, icons, and tree-view";
    "org.opencontainers.image.version" = pkgs.lsd.version;
  };
}

{ mkImage, pkgs, lib, ... }:

# Coder - Remote development environments
# https://coder.com/

mkImage {
  drv = pkgs.coder;
  name = "coder";
  tag = "v${pkgs.coder.version}";
  entrypoint = [ "${pkgs.coder}/bin/coder" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Coder";
    "org.opencontainers.image.description" = "Provision remote development environments";
    "org.opencontainers.image.version" = pkgs.coder.version;
  };
}

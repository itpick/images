{ mkImage, pkgs, lib, ... }:

# rage - Simple, secure encryption
# https://github.com/str4d/rage

mkImage {
  drv = pkgs.rage;
  name = "rage";
  tag = "v${pkgs.rage.version}";
  entrypoint = [ "${pkgs.rage}/bin/rage" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "rage";
    "org.opencontainers.image.description" = "Simple, secure, and modern encryption tool";
    "org.opencontainers.image.version" = pkgs.rage.version;
  };
}

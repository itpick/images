{ mkImage, pkgs, lib, ... }:

# btop - Resource monitor
# https://github.com/aristocratos/btop

mkImage {
  drv = pkgs.btop;
  name = "btop";
  tag = "v${pkgs.btop.version}";
  entrypoint = [ "${pkgs.btop}/bin/btop" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "btop";
    "org.opencontainers.image.description" = "Monitor of resources";
    "org.opencontainers.image.version" = pkgs.btop.version;
  };
}

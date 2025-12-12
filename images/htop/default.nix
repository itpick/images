{ mkImage, pkgs, lib, ... }:

# htop - Interactive process viewer
# https://htop.dev/

mkImage {
  drv = pkgs.htop;
  name = "htop";
  tag = "v${pkgs.htop.version}";
  entrypoint = [ "${pkgs.htop}/bin/htop" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "htop";
    "org.opencontainers.image.description" = "Interactive process viewer";
    "org.opencontainers.image.version" = pkgs.htop.version;
  };
}

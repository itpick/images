{ mkImage, pkgs, lib, ... }:

# fd - Fast and user-friendly alternative to find
# https://github.com/sharkdp/fd

mkImage {
  drv = pkgs.fd;
  name = "fd";
  tag = "v${pkgs.fd.version}";
  entrypoint = [ "${pkgs.fd}/bin/fd" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fd";
    "org.opencontainers.image.description" = "Simple, fast and user-friendly alternative to find";
    "org.opencontainers.image.version" = pkgs.fd.version;
  };
}

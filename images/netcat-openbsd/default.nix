{ mkImage, pkgs, lib, ... }:

# netcat-openbsd - Network utility
# https://salsa.debian.org/debian/netcat-openbsd

mkImage {
  drv = pkgs.netcat-openbsd;
  name = "netcat-openbsd";
  tag = "v${pkgs.netcat-openbsd.version}";
  entrypoint = [ "${pkgs.netcat-openbsd}/bin/nc" ];
  cmd = [ "-h" ];

  labels = {
    "org.opencontainers.image.title" = "netcat-openbsd";
    "org.opencontainers.image.description" = "TCP/IP Swiss Army knife";
    "org.opencontainers.image.version" = pkgs.netcat-openbsd.version;
  };
}

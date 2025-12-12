{ mkImage, pkgs, lib, ... }:

# rTorrent - BitTorrent client
# https://github.com/rakshasa/rtorrent

mkImage {
  drv = pkgs.rtorrent;
  name = "rtorrent";
  tag = "v${pkgs.rtorrent.version}";
  entrypoint = [ "${pkgs.rtorrent}/bin/rtorrent" ];
  cmd = [ "-h" ];

  labels = {
    "org.opencontainers.image.title" = "rTorrent";
    "org.opencontainers.image.description" = "BitTorrent client";
    "org.opencontainers.image.version" = pkgs.rtorrent.version;
  };
}

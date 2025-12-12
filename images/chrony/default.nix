{ mkImage, pkgs, lib, ... }:

# Chrony - NTP implementation
# https://chrony.tuxfamily.org/

mkImage {
  drv = pkgs.chrony;
  name = "chrony";
  tag = "v${pkgs.chrony.version}";
  entrypoint = [ "${pkgs.chrony}/bin/chronyd" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Chrony";
    "org.opencontainers.image.description" = "NTP implementation for time synchronization";
    "org.opencontainers.image.version" = pkgs.chrony.version;
  };
}

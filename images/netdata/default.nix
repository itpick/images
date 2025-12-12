{ mkImage, pkgs, lib, ... }:

# Netdata - Real-time performance monitoring
# https://www.netdata.cloud/

mkImage {
  drv = pkgs.netdata;
  name = "netdata";
  tag = "v${pkgs.netdata.version}";
  entrypoint = [ "${pkgs.netdata}/bin/netdata" ];
  cmd = [ "-D" ];

  labels = {
    "org.opencontainers.image.title" = "Netdata";
    "org.opencontainers.image.description" = "Real-time performance monitoring";
    "org.opencontainers.image.version" = pkgs.netdata.version;
  };
}

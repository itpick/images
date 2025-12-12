{ mkImage, pkgs, lib, ... }:

# tcpdump - Network packet analyzer
# https://www.tcpdump.org/

mkImage {
  drv = pkgs.tcpdump;
  name = "tcpdump";
  tag = "v${pkgs.tcpdump.version}";
  entrypoint = [ "${pkgs.tcpdump}/bin/tcpdump" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "tcpdump";
    "org.opencontainers.image.description" = "Network packet sniffer";
    "org.opencontainers.image.version" = pkgs.tcpdump.version;
  };
}

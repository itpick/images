{ mkImage, pkgs, lib, ... }:

# Nmap - Network scanner
# https://nmap.org/

mkImage {
  drv = pkgs.nmap;
  name = "nmap";
  tag = "v${pkgs.nmap.version}";
  entrypoint = [ "${pkgs.nmap}/bin/nmap" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Nmap";
    "org.opencontainers.image.description" = "Network discovery and security auditing tool";
    "org.opencontainers.image.version" = pkgs.nmap.version;
  };
}

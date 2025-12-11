{ mkImage, pkgs, lib, ... }:

# PowerDNS Recursor - High-performance DNS recursor
# https://www.powerdns.com/recursor.html

mkImage {
  drv = pkgs.pdns-recursor;
  name = "pdns-recursor";
  tag = "v${pkgs.pdns-recursor.version}";
  entrypoint = [ "${pkgs.pdns-recursor}/bin/pdns_recursor" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "PowerDNS Recursor";
    "org.opencontainers.image.description" = "High-performance DNS recursor";
    "org.opencontainers.image.version" = pkgs.pdns-recursor.version;
  };
}

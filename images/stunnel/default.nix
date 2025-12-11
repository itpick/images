{ mkImage, pkgs, lib, ... }:

# Stunnel - SSL/TLS tunneling proxy
# https://www.stunnel.org/

mkImage {
  drv = pkgs.stunnel;
  name = "stunnel";
  tag = "v${pkgs.stunnel.version}";
  entrypoint = [ "${pkgs.stunnel}/bin/stunnel" ];
  cmd = [ "-help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Stunnel";
    "org.opencontainers.image.description" = "Universal SSL/TLS tunneling proxy";
    "org.opencontainers.image.version" = pkgs.stunnel.version;
  };
}

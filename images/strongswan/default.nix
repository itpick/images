{ mkImage, pkgs, lib, ... }:

# strongSwan - IPsec VPN solution
# https://www.strongswan.org/

mkImage {
  drv = pkgs.strongswan;
  name = "strongswan";
  tag = "v${pkgs.strongswan.version}";
  entrypoint = [ "${pkgs.strongswan}/bin/swanctl" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "strongSwan";
    "org.opencontainers.image.description" = "IPsec-based VPN solution for Linux";
    "org.opencontainers.image.version" = pkgs.strongswan.version;
  };
}

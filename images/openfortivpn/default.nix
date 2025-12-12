{ mkImage, pkgs, lib, ... }:

# openfortivpn - Fortinet VPN client
# https://github.com/adrienverge/openfortivpn

mkImage {
  drv = pkgs.openfortivpn;
  name = "openfortivpn";
  tag = "v${pkgs.openfortivpn.version}";
  entrypoint = [ "${pkgs.openfortivpn}/bin/openfortivpn" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "openfortivpn";
    "org.opencontainers.image.description" = "Client for PPP+SSL VPN tunnel services";
    "org.opencontainers.image.version" = pkgs.openfortivpn.version;
  };
}

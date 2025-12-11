{ mkImage, pkgs, lib, ... }:

# Authentik - Identity Provider
# https://goauthentik.io/

mkImage {
  drv = pkgs.authentik;
  name = "authentik";
  tag = "v${pkgs.authentik.version}";
  entrypoint = [ "${pkgs.authentik}/bin/ak" ];
  cmd = [ "server" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Authentik";
    "org.opencontainers.image.description" = "Open-source Identity Provider";
    "org.opencontainers.image.version" = pkgs.authentik.version;
  };
}

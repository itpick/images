# gatus
# =============
# Gatus - Automated service health dashboard
# https://github.com/TwiN/gatus
#
# Gatus is a developer-oriented health dashboard that gives you
# the ability to monitor your services.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.gatus;
  name = "gatus";
  tag = "v${pkgs.gatus.version}";
  entrypoint = [ "${pkgs.gatus}/bin/gatus" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Gatus";
    "org.opencontainers.image.description" = "Automated service health dashboard";
    "org.opencontainers.image.version" = pkgs.gatus.version;
  };
}

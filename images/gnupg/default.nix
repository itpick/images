{ mkImage, pkgs, lib, ... }:

# GnuPG - GNU Privacy Guard
# https://gnupg.org/

mkImage {
  drv = pkgs.gnupg;
  name = "gnupg";
  tag = "v${pkgs.gnupg.version}";
  entrypoint = [ "${pkgs.gnupg}/bin/gpg" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "GnuPG";
    "org.opencontainers.image.description" = "Complete implementation of the OpenPGP standard";
    "org.opencontainers.image.version" = pkgs.gnupg.version;
  };
}

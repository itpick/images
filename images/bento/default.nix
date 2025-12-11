# bento
# =============
# Bento - Stream processing made simple
# https://www.benthos.dev/
#
# Bento (formerly Benthos) is a high performance stream processor
# for mundane tasks like data routing and transformation.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.bento;
  name = "bento";
  tag = "v${pkgs.bento.version}";
  entrypoint = [ "${pkgs.bento}/bin/bento" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Bento";
    "org.opencontainers.image.description" = "High performance stream processor";
    "org.opencontainers.image.version" = pkgs.bento.version;
  };
}

# chisel
# =============
# Chisel - Fast TCP/UDP tunnel over HTTP
# https://github.com/jpillora/chisel
#
# Chisel is a fast TCP/UDP tunnel, transported over HTTP, secured via SSH.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.chisel;
  name = "chisel";
  tag = "v${pkgs.chisel.version}";
  entrypoint = [ "${pkgs.chisel}/bin/chisel" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Chisel";
    "org.opencontainers.image.description" = "Fast TCP/UDP tunnel over HTTP";
    "org.opencontainers.image.version" = pkgs.chisel.version;
  };
}

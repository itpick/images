{ mkImage, pkgs, lib, ... }:

# Kubo (IPFS) - Interplanetary File System
# https://ipfs.tech/

mkImage {
  drv = pkgs.kubo;
  name = "kubo";
  tag = "v${pkgs.kubo.version}";
  entrypoint = [ "${pkgs.kubo}/bin/ipfs" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kubo (IPFS)";
    "org.opencontainers.image.description" = "Go implementation of IPFS";
    "org.opencontainers.image.version" = pkgs.kubo.version;
  };
}

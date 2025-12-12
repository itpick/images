{ mkImage, pkgs, lib, ... }:

# Conduit - Matrix homeserver
# https://conduit.rs/

mkImage {
  drv = pkgs.conduit;
  name = "conduit";
  tag = "v${pkgs.conduit.version}";
  entrypoint = [ "${pkgs.conduit}/bin/conduit" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Conduit";
    "org.opencontainers.image.description" = "Lightweight Matrix homeserver written in Rust";
    "org.opencontainers.image.version" = pkgs.conduit.version;
  };
}

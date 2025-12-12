{ mkImage, pkgs, lib, ... }:

# Buf - Protocol buffer tooling
# https://buf.build/

mkImage {
  drv = pkgs.buf;
  name = "buf";
  tag = "v${pkgs.buf.version}";
  entrypoint = [ "${pkgs.buf}/bin/buf" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Buf";
    "org.opencontainers.image.description" = "Protocol buffer tooling for building and linting";
    "org.opencontainers.image.version" = pkgs.buf.version;
  };
}

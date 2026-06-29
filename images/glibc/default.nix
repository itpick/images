{ mkImage, pkgs, lib, ... }:

# glibc
# Container image packaging nixpkgs.glibc
mkImage {
  drv = pkgs.glibc;
  name = "glibc";
  tag = "v${pkgs.glibc.version}";
  entrypoint = [ (lib.getExe pkgs.glibc) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "glibc";
    "org.opencontainers.image.description" = "glibc container image (nixpkgs.glibc)";
    "org.opencontainers.image.version" = pkgs.glibc.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

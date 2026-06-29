{ mkImage, pkgs, lib, ... }:

# runc-fips
# Container image packaging nixpkgs.runc
mkImage {
  drv = pkgs.runc;
  name = "runc-fips";
  tag = "v${pkgs.runc.version}";
  entrypoint = [ (lib.getExe pkgs.runc) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "runc-fips";
    "org.opencontainers.image.description" = "runc-fips container image (nixpkgs.runc)";
    "org.opencontainers.image.version" = pkgs.runc.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

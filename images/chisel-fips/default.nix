{ mkImage, pkgs, lib, ... }:

# chisel-fips
# Container image packaging nixpkgs.chisel
mkImage {
  drv = pkgs.chisel;
  name = "chisel-fips";
  tag = "v${pkgs.chisel.version}";
  entrypoint = [ (lib.getExe pkgs.chisel) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "chisel-fips";
    "org.opencontainers.image.description" = "chisel-fips container image (nixpkgs.chisel)";
    "org.opencontainers.image.version" = pkgs.chisel.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

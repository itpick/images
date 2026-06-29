{ mkImage, pkgs, lib, ... }:

# nsc-fips
# Container image packaging nixpkgs.nsc
mkImage {
  drv = pkgs.nsc;
  name = "nsc-fips";
  tag = "v${pkgs.nsc.version}";
  entrypoint = [ (lib.getExe pkgs.nsc) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nsc-fips";
    "org.opencontainers.image.description" = "nsc-fips container image (nixpkgs.nsc)";
    "org.opencontainers.image.version" = pkgs.nsc.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

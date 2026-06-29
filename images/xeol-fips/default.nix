{ mkImage, pkgs, lib, ... }:

# xeol-fips
# Container image packaging nixpkgs.xeol
mkImage {
  drv = pkgs.xeol;
  name = "xeol-fips";
  tag = "v${pkgs.xeol.version}";
  entrypoint = [ (lib.getExe pkgs.xeol) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "xeol-fips";
    "org.opencontainers.image.description" = "xeol-fips container image (nixpkgs.xeol)";
    "org.opencontainers.image.version" = pkgs.xeol.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

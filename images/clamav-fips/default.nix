{ mkImage, pkgs, lib, ... }:

# clamav-fips
# Container image packaging nixpkgs.clamav
mkImage {
  drv = pkgs.clamav;
  name = "clamav-fips";
  tag = "v${pkgs.clamav.version}";
  entrypoint = [ (lib.getExe pkgs.clamav) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "clamav-fips";
    "org.opencontainers.image.description" = "clamav-fips container image (nixpkgs.clamav)";
    "org.opencontainers.image.version" = pkgs.clamav.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

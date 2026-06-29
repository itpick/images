{ mkImage, pkgs, lib, ... }:

# contour-fips
# Container image packaging nixpkgs.contour
mkImage {
  drv = pkgs.contour;
  name = "contour-fips";
  tag = "v${pkgs.contour.version}";
  entrypoint = [ (lib.getExe pkgs.contour) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "contour-fips";
    "org.opencontainers.image.description" = "contour-fips container image (nixpkgs.contour)";
    "org.opencontainers.image.version" = pkgs.contour.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# contour-nixchart-fips
# Container image packaging nixpkgs.contour
mkImage {
  drv = pkgs.contour;
  name = "contour-nixchart-fips";
  tag = "v${pkgs.contour.version}";
  entrypoint = [ (lib.getExe pkgs.contour) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "contour-nixchart-fips";
    "org.opencontainers.image.description" = "contour-nixchart-fips container image (nixpkgs.contour)";
    "org.opencontainers.image.version" = pkgs.contour.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

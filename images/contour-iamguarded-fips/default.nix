{ mkImage, pkgs, lib, ... }:

# contour-iamguarded-fips
# Container image packaging nixpkgs.contour
mkImage {
  drv = pkgs.contour;
  name = "contour-iamguarded-fips";
  tag = "v${pkgs.contour.version}";
  entrypoint = [ (lib.getExe pkgs.contour) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "contour-iamguarded-fips";
    "org.opencontainers.image.description" = "contour-iamguarded-fips container image (nixpkgs.contour)";
    "org.opencontainers.image.version" = pkgs.contour.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

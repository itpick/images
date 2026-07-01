{ mkImage, pkgs, lib, ... }:

# contour-nixchart
# Container image packaging nixpkgs.contour
mkImage {
  drv = pkgs.contour;
  name = "contour-nixchart";
  tag = "v${pkgs.contour.version}";
  entrypoint = [ (lib.getExe pkgs.contour) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "contour-nixchart";
    "org.opencontainers.image.description" = "contour-nixchart container image (nixpkgs.contour)";
    "org.opencontainers.image.version" = pkgs.contour.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

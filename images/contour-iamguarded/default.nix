{ mkImage, pkgs, lib, ... }:

# contour-iamguarded
# Container image packaging nixpkgs.contour
mkImage {
  drv = pkgs.contour;
  name = "contour-iamguarded";
  tag = "v${pkgs.contour.version}";
  entrypoint = [ (lib.getExe pkgs.contour) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "contour-iamguarded";
    "org.opencontainers.image.description" = "contour-iamguarded container image (nixpkgs.contour)";
    "org.opencontainers.image.version" = pkgs.contour.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

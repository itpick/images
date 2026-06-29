{ mkImage, pkgs, lib, ... }:

# openscap
# Container image packaging nixpkgs.openscap
mkImage {
  drv = pkgs.openscap;
  name = "openscap";
  tag = "v${pkgs.openscap.version}";
  entrypoint = [ (lib.getExe pkgs.openscap) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "openscap";
    "org.opencontainers.image.description" = "openscap container image (nixpkgs.openscap)";
    "org.opencontainers.image.version" = pkgs.openscap.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# gops-fips
# Container image packaging nixpkgs.gops
mkImage {
  drv = pkgs.gops;
  name = "gops-fips";
  tag = "v${pkgs.gops.version}";
  entrypoint = [ (lib.getExe pkgs.gops) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gops-fips";
    "org.opencontainers.image.description" = "gops-fips container image (nixpkgs.gops)";
    "org.opencontainers.image.version" = pkgs.gops.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# kapp-fips
# Container image packaging nixpkgs.kapp
mkImage {
  drv = pkgs.kapp;
  name = "kapp-fips";
  tag = "v${pkgs.kapp.version}";
  entrypoint = [ (lib.getExe pkgs.kapp) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kapp-fips";
    "org.opencontainers.image.description" = "kapp-fips container image (nixpkgs.kapp)";
    "org.opencontainers.image.version" = pkgs.kapp.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# syncthing-fips
# Container image packaging nixpkgs.syncthing
mkImage {
  drv = pkgs.syncthing;
  name = "syncthing-fips";
  tag = "v${pkgs.syncthing.version}";
  entrypoint = [ (lib.getExe pkgs.syncthing) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "syncthing-fips";
    "org.opencontainers.image.description" = "syncthing-fips container image (nixpkgs.syncthing)";
    "org.opencontainers.image.version" = pkgs.syncthing.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

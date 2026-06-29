{ mkImage, pkgs, lib, ... }:

# hubble-fips
# Container image packaging nixpkgs.hubble
mkImage {
  drv = pkgs.hubble;
  name = "hubble-fips";
  tag = "v${pkgs.hubble.version}";
  entrypoint = [ (lib.getExe pkgs.hubble) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "hubble-fips";
    "org.opencontainers.image.description" = "hubble-fips container image (nixpkgs.hubble)";
    "org.opencontainers.image.version" = pkgs.hubble.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

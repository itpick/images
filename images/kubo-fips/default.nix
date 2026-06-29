{ mkImage, pkgs, lib, ... }:

# kubo-fips
# Container image packaging nixpkgs.kubo
mkImage {
  drv = pkgs.kubo;
  name = "kubo-fips";
  tag = "v${pkgs.kubo.version}";
  entrypoint = [ (lib.getExe pkgs.kubo) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kubo-fips";
    "org.opencontainers.image.description" = "kubo-fips container image (nixpkgs.kubo)";
    "org.opencontainers.image.version" = pkgs.kubo.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

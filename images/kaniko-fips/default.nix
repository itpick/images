{ mkImage, pkgs, lib, ... }:

# kaniko-fips
# Container image packaging nixpkgs.kaniko
mkImage {
  drv = pkgs.kaniko;
  name = "kaniko-fips";
  tag = "v${pkgs.kaniko.version}";
  entrypoint = [ (lib.getExe pkgs.kaniko) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kaniko-fips";
    "org.opencontainers.image.description" = "kaniko-fips container image (nixpkgs.kaniko)";
    "org.opencontainers.image.version" = pkgs.kaniko.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

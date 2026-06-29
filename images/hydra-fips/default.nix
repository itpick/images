{ mkImage, pkgs, lib, ... }:

# hydra-fips
# Container image packaging nixpkgs.hydra
mkImage {
  drv = pkgs.hydra;
  name = "hydra-fips";
  tag = "v${pkgs.hydra.version}";
  entrypoint = [ (lib.getExe pkgs.hydra) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "hydra-fips";
    "org.opencontainers.image.description" = "hydra-fips container image (nixpkgs.hydra)";
    "org.opencontainers.image.version" = pkgs.hydra.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# sops-fips
# Container image packaging nixpkgs.sops
mkImage {
  drv = pkgs.sops;
  name = "sops-fips";
  tag = "v${pkgs.sops.version}";
  entrypoint = [ (lib.getExe pkgs.sops) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "sops-fips";
    "org.opencontainers.image.description" = "sops-fips container image (nixpkgs.sops)";
    "org.opencontainers.image.version" = pkgs.sops.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# renovate-fips
# Container image packaging nixpkgs.renovate
mkImage {
  drv = pkgs.renovate;
  name = "renovate-fips";
  tag = "v${pkgs.renovate.version}";
  entrypoint = [ (lib.getExe pkgs.renovate) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "renovate-fips";
    "org.opencontainers.image.description" = "renovate-fips container image (nixpkgs.renovate)";
    "org.opencontainers.image.version" = pkgs.renovate.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

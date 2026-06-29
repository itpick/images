{ mkImage, pkgs, lib, ... }:

# grype-fips
# Container image packaging nixpkgs.grype
mkImage {
  drv = pkgs.grype;
  name = "grype-fips";
  tag = "v${pkgs.grype.version}";
  entrypoint = [ (lib.getExe pkgs.grype) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "grype-fips";
    "org.opencontainers.image.description" = "grype-fips container image (nixpkgs.grype)";
    "org.opencontainers.image.version" = pkgs.grype.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

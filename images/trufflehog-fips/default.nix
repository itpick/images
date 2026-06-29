{ mkImage, pkgs, lib, ... }:

# trufflehog-fips
# Container image packaging nixpkgs.trufflehog
mkImage {
  drv = pkgs.trufflehog;
  name = "trufflehog-fips";
  tag = "v${pkgs.trufflehog.version}";
  entrypoint = [ (lib.getExe pkgs.trufflehog) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "trufflehog-fips";
    "org.opencontainers.image.description" = "trufflehog-fips container image (nixpkgs.trufflehog)";
    "org.opencontainers.image.version" = pkgs.trufflehog.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

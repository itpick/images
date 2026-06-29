{ mkImage, pkgs, lib, ... }:

# gpgme-fips
# Container image packaging nixpkgs.gpgme
mkImage {
  drv = pkgs.gpgme;
  name = "gpgme-fips";
  tag = "v${pkgs.gpgme.version}";
  entrypoint = [ (lib.getExe pkgs.gpgme) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gpgme-fips";
    "org.opencontainers.image.description" = "gpgme-fips container image (nixpkgs.gpgme)";
    "org.opencontainers.image.version" = pkgs.gpgme.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

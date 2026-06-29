{ mkImage, pkgs, lib, ... }:

# openldap-fips
# Container image packaging nixpkgs.openldap
mkImage {
  drv = pkgs.openldap;
  name = "openldap-fips";
  tag = "v${pkgs.openldap.version}";
  entrypoint = [ (lib.getExe pkgs.openldap) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "openldap-fips";
    "org.opencontainers.image.description" = "openldap-fips container image (nixpkgs.openldap)";
    "org.opencontainers.image.version" = pkgs.openldap.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

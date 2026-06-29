{ mkImage, pkgs, lib, ... }:

# keycloak-iamguarded-fips
# Container image packaging nixpkgs.keycloak
mkImage {
  drv = pkgs.keycloak;
  name = "keycloak-iamguarded-fips";
  tag = "v${pkgs.keycloak.version}";
  entrypoint = [ (lib.getExe pkgs.keycloak) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "keycloak-iamguarded-fips";
    "org.opencontainers.image.description" = "keycloak-iamguarded-fips container image (nixpkgs.keycloak)";
    "org.opencontainers.image.version" = pkgs.keycloak.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# keycloak-iamguarded
# Container image packaging nixpkgs.keycloak
mkImage {
  drv = pkgs.keycloak;
  name = "keycloak-iamguarded";
  tag = "v${pkgs.keycloak.version}";
  entrypoint = [ (lib.getExe pkgs.keycloak) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "keycloak-iamguarded";
    "org.opencontainers.image.description" = "keycloak-iamguarded container image (nixpkgs.keycloak)";
    "org.opencontainers.image.version" = pkgs.keycloak.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

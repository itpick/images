{ mkImage, pkgs, lib, ... }:

# keycloak-nixchart
# Container image packaging nixpkgs.keycloak
mkImage {
  drv = pkgs.keycloak;
  name = "keycloak-nixchart";
  tag = "v${pkgs.keycloak.version}";
  entrypoint = [ (lib.getExe pkgs.keycloak) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "keycloak-nixchart";
    "org.opencontainers.image.description" = "keycloak-nixchart container image (nixpkgs.keycloak)";
    "org.opencontainers.image.version" = pkgs.keycloak.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

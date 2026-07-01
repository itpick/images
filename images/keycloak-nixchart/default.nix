{ mkImage, pkgs, lib, ... }:

# keycloak-nixchart
# =================
# Keycloak for consumption by the charts/keycloak chart.
# Chart supplies KC_* env vars (Keycloak's own convention) which
# nixpkgs.keycloak reads natively.

mkImage {
  drv = pkgs.keycloak;
  name = "keycloak-nixchart";
  tag = "v${pkgs.keycloak.version}";
  entrypoint = [ (lib.getExe pkgs.keycloak) ];
  cmd = [ "start" ];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "keycloak-nixchart";
    "org.opencontainers.image.description" = "Keycloak tuned for the nix-containers charts/keycloak chart";
    "org.opencontainers.image.version" = pkgs.keycloak.version;
    "io.nix-containers.chart" = "keycloak";
  };
}

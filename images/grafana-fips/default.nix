{ mkImage, pkgs, lib, ... }:

# grafana-fips
# Container image packaging nixpkgs.grafana
mkImage {
  drv = pkgs.grafana;
  name = "grafana-fips";
  tag = "v${pkgs.grafana.version}";
  entrypoint = [ (lib.getExe pkgs.grafana) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "grafana-fips";
    "org.opencontainers.image.description" = "grafana-fips container image (nixpkgs.grafana)";
    "org.opencontainers.image.version" = pkgs.grafana.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# grafana-alloy-fips
# Container image packaging nixpkgs.grafana-alloy
mkImage {
  drv = pkgs.grafana-alloy;
  name = "grafana-alloy-fips";
  tag = "v${pkgs.grafana-alloy.version}";
  entrypoint = [ (lib.getExe pkgs.grafana-alloy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "grafana-alloy-fips";
    "org.opencontainers.image.description" = "grafana-alloy-fips container image (nixpkgs.grafana-alloy)";
    "org.opencontainers.image.version" = pkgs.grafana-alloy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

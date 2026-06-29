{ mkImage, pkgs, lib, ... }:

# metricbeat-fips
# Container image packaging nixpkgs.metricbeat
mkImage {
  drv = pkgs.metricbeat;
  name = "metricbeat-fips";
  tag = "v${pkgs.metricbeat.version}";
  entrypoint = [ (lib.getExe pkgs.metricbeat) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "metricbeat-fips";
    "org.opencontainers.image.description" = "metricbeat-fips container image (nixpkgs.metricbeat)";
    "org.opencontainers.image.version" = pkgs.metricbeat.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# opentelemetry-collector-fips
# Container image packaging nixpkgs.opentelemetry-collector
mkImage {
  drv = pkgs.opentelemetry-collector;
  name = "opentelemetry-collector-fips";
  tag = "v${pkgs.opentelemetry-collector.version}";
  entrypoint = [ (lib.getExe pkgs.opentelemetry-collector) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "opentelemetry-collector-fips";
    "org.opencontainers.image.description" = "opentelemetry-collector-fips container image (nixpkgs.opentelemetry-collector)";
    "org.opencontainers.image.version" = pkgs.opentelemetry-collector.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

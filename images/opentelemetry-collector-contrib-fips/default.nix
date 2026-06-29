{ mkImage, pkgs, lib, ... }:

# opentelemetry-collector-contrib-fips
# Container image packaging nixpkgs.opentelemetry-collector-contrib
mkImage {
  drv = pkgs.opentelemetry-collector-contrib;
  name = "opentelemetry-collector-contrib-fips";
  tag = "v${pkgs.opentelemetry-collector-contrib.version}";
  entrypoint = [ (lib.getExe pkgs.opentelemetry-collector-contrib) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "opentelemetry-collector-contrib-fips";
    "org.opencontainers.image.description" = "opentelemetry-collector-contrib-fips container image (nixpkgs.opentelemetry-collector-contrib)";
    "org.opencontainers.image.version" = pkgs.opentelemetry-collector-contrib.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# grpc-health-probe-fips
# Container image packaging nixpkgs.grpc-health-probe
mkImage {
  drv = pkgs.grpc-health-probe;
  name = "grpc-health-probe-fips";
  tag = "v${pkgs.grpc-health-probe.version}";
  entrypoint = [ (lib.getExe pkgs.grpc-health-probe) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "grpc-health-probe-fips";
    "org.opencontainers.image.description" = "grpc-health-probe-fips container image (nixpkgs.grpc-health-probe)";
    "org.opencontainers.image.version" = pkgs.grpc-health-probe.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# thanos-nixchart-fips
# Container image packaging nixpkgs.thanos
mkImage {
  drv = pkgs.thanos;
  name = "thanos-nixchart-fips";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ (lib.getExe pkgs.thanos) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "thanos-nixchart-fips";
    "org.opencontainers.image.description" = "thanos-nixchart-fips container image (nixpkgs.thanos)";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

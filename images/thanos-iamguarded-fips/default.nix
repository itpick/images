{ mkImage, pkgs, lib, ... }:

# thanos-iamguarded-fips
# Container image packaging nixpkgs.thanos
mkImage {
  drv = pkgs.thanos;
  name = "thanos-iamguarded-fips";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ (lib.getExe pkgs.thanos) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "thanos-iamguarded-fips";
    "org.opencontainers.image.description" = "thanos-iamguarded-fips container image (nixpkgs.thanos)";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# thanos-fips
# Container image packaging nixpkgs.thanos
mkImage {
  drv = pkgs.thanos;
  name = "thanos-fips";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ (lib.getExe pkgs.thanos) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "thanos-fips";
    "org.opencontainers.image.description" = "thanos-fips container image (nixpkgs.thanos)";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

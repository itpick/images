{ mkImage, pkgs, lib, ... }:

# loki-fips
# Container image packaging nixpkgs.loki
mkImage {
  drv = pkgs.loki;
  name = "loki-fips";
  tag = "v${pkgs.loki.version}";
  entrypoint = [ (lib.getExe pkgs.loki) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "loki-fips";
    "org.opencontainers.image.description" = "loki-fips container image (nixpkgs.loki)";
    "org.opencontainers.image.version" = pkgs.loki.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

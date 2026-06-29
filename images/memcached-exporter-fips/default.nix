{ mkImage, pkgs, lib, ... }:

# memcached-exporter-fips
# Container image packaging nixpkgs.memcached-exporter
mkImage {
  drv = pkgs.memcached-exporter;
  name = "memcached-exporter-fips";
  tag = "v${pkgs.memcached-exporter.version}";
  entrypoint = [ (lib.getExe pkgs.memcached-exporter) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "memcached-exporter-fips";
    "org.opencontainers.image.description" = "memcached-exporter-fips container image (nixpkgs.memcached-exporter)";
    "org.opencontainers.image.version" = pkgs.memcached-exporter.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

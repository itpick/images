{ mkImage, pkgs, lib, ... }:

# memcached-exporter-iamguarded
# Container image packaging nixpkgs.memcached-exporter
mkImage {
  drv = pkgs.memcached-exporter;
  name = "memcached-exporter-iamguarded";
  tag = "v${pkgs.memcached-exporter.version}";
  entrypoint = [ (lib.getExe pkgs.memcached-exporter) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "memcached-exporter-iamguarded";
    "org.opencontainers.image.description" = "memcached-exporter-iamguarded container image (nixpkgs.memcached-exporter)";
    "org.opencontainers.image.version" = pkgs.memcached-exporter.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

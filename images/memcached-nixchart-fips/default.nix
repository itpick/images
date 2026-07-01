{ mkImage, pkgs, lib, ... }:

# memcached-nixchart-fips
# Container image packaging nixpkgs.memcached
mkImage {
  drv = pkgs.memcached;
  name = "memcached-nixchart-fips";
  tag = "v${pkgs.memcached.version}";
  entrypoint = [ (lib.getExe pkgs.memcached) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "memcached-nixchart-fips";
    "org.opencontainers.image.description" = "memcached-nixchart-fips container image (nixpkgs.memcached)";
    "org.opencontainers.image.version" = pkgs.memcached.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

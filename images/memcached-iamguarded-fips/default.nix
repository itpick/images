{ mkImage, pkgs, lib, ... }:

# memcached-iamguarded-fips
# Container image packaging nixpkgs.memcached
mkImage {
  drv = pkgs.memcached;
  name = "memcached-iamguarded-fips";
  tag = "v${pkgs.memcached.version}";
  entrypoint = [ (lib.getExe pkgs.memcached) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "memcached-iamguarded-fips";
    "org.opencontainers.image.description" = "memcached-iamguarded-fips container image (nixpkgs.memcached)";
    "org.opencontainers.image.version" = pkgs.memcached.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

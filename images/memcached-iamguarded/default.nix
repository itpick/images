{ mkImage, pkgs, lib, ... }:

# memcached-iamguarded
# Container image packaging nixpkgs.memcached
mkImage {
  drv = pkgs.memcached;
  name = "memcached-iamguarded";
  tag = "v${pkgs.memcached.version}";
  entrypoint = [ (lib.getExe pkgs.memcached) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "memcached-iamguarded";
    "org.opencontainers.image.description" = "memcached-iamguarded container image (nixpkgs.memcached)";
    "org.opencontainers.image.version" = pkgs.memcached.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

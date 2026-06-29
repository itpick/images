{ mkImage, pkgs, lib, ... }:

# openresty-fips
# Container image packaging nixpkgs.openresty
mkImage {
  drv = pkgs.openresty;
  name = "openresty-fips";
  tag = "v${pkgs.openresty.version}";
  entrypoint = [ (lib.getExe pkgs.openresty) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "openresty-fips";
    "org.opencontainers.image.description" = "openresty-fips container image (nixpkgs.openresty)";
    "org.opencontainers.image.version" = pkgs.openresty.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# caddy-fips
# Container image packaging nixpkgs.caddy
mkImage {
  drv = pkgs.caddy;
  name = "caddy-fips";
  tag = "v${pkgs.caddy.version}";
  entrypoint = [ (lib.getExe pkgs.caddy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "caddy-fips";
    "org.opencontainers.image.description" = "caddy-fips container image (nixpkgs.caddy)";
    "org.opencontainers.image.version" = pkgs.caddy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

{ mkImage, pkgs, lib, ... }:

# php-fips
# Container image packaging nixpkgs.php
mkImage {
  drv = pkgs.php;
  name = "php-fips";
  tag = "v${pkgs.php.version}";
  entrypoint = [ (lib.getExe pkgs.php) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "php-fips";
    "org.opencontainers.image.description" = "php-fips container image (nixpkgs.php)";
    "org.opencontainers.image.version" = pkgs.php.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

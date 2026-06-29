{ mkImage, pkgs, lib, ... }:

# gomplate-fips
# Container image packaging nixpkgs.gomplate
mkImage {
  drv = pkgs.gomplate;
  name = "gomplate-fips";
  tag = "v${pkgs.gomplate.version}";
  entrypoint = [ (lib.getExe pkgs.gomplate) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gomplate-fips";
    "org.opencontainers.image.description" = "gomplate-fips container image (nixpkgs.gomplate)";
    "org.opencontainers.image.version" = pkgs.gomplate.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

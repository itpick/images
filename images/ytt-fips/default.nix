{ mkImage, pkgs, lib, ... }:

# ytt-fips
# Container image packaging nixpkgs.ytt
mkImage {
  drv = pkgs.ytt;
  name = "ytt-fips";
  tag = "v${pkgs.ytt.version}";
  entrypoint = [ (lib.getExe pkgs.ytt) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ytt-fips";
    "org.opencontainers.image.description" = "ytt-fips container image (nixpkgs.ytt)";
    "org.opencontainers.image.version" = pkgs.ytt.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

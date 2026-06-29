{ mkImage, pkgs, lib, ... }:

# filebeat-fips
# Container image packaging nixpkgs.filebeat
mkImage {
  drv = pkgs.filebeat;
  name = "filebeat-fips";
  tag = "v${pkgs.filebeat.version}";
  entrypoint = [ (lib.getExe pkgs.filebeat) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "filebeat-fips";
    "org.opencontainers.image.description" = "filebeat-fips container image (nixpkgs.filebeat)";
    "org.opencontainers.image.version" = pkgs.filebeat.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

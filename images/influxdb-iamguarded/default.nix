{ mkImage, pkgs, lib, ... }:

# influxdb-iamguarded
# Container image packaging nixpkgs.influxdb
mkImage {
  drv = pkgs.influxdb;
  name = "influxdb-iamguarded";
  tag = "v${pkgs.influxdb.version}";
  entrypoint = [ (lib.getExe pkgs.influxdb) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "influxdb-iamguarded";
    "org.opencontainers.image.description" = "influxdb-iamguarded container image (nixpkgs.influxdb)";
    "org.opencontainers.image.version" = pkgs.influxdb.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

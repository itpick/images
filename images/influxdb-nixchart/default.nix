{ mkImage, pkgs, lib, ... }:

# influxdb-nixchart
# Container image packaging nixpkgs.influxdb
mkImage {
  drv = pkgs.influxdb;
  name = "influxdb-nixchart";
  tag = "v${pkgs.influxdb.version}";
  entrypoint = [ (lib.getExe pkgs.influxdb) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "influxdb-nixchart";
    "org.opencontainers.image.description" = "influxdb-nixchart container image (nixpkgs.influxdb)";
    "org.opencontainers.image.version" = pkgs.influxdb.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

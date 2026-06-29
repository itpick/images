{ mkImage, pkgs, lib, ... }:

# influx
mkImage {
  drv = pkgs.influxdb;
  name = "influx";
  tag = "v${pkgs.influxdb.version}";
  entrypoint = [ (lib.getExe pkgs.influxdb) ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "influx";
    "org.opencontainers.image.description" = "influx container image (nixpkgs.influxdb)";
    "org.opencontainers.image.version" = pkgs.influxdb.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}

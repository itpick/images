{ mkImage, pkgs, lib, ... }:

# Uses cloudnative-pg package from pkgs/cloudnative-pg
# Built from wolfi-dev/os cloudnative-pg.yaml
# https://github.com/cloudnative-pg/cloudnative-pg

let
  cloudnative-pg = pkgs.cloudnative-pg;
  version = cloudnative-pg.version;
in
mkImage {
  drv = cloudnative-pg;
  name = "cloudnative-pg";
  tag = "v${version}";
  entrypoint = [ "${cloudnative-pg}/bin/manager" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CloudNativePG Operator";
    "org.opencontainers.image.description" = "PostgreSQL operator for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cloudnative-pg";
  };
}

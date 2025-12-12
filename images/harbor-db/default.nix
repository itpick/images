{ mkImage, pkgs, lib, ... }:

# Harbor Database - PostgreSQL database for Harbor registry
# Uses PostgreSQL configured for Harbor

mkImage {
  drv = pkgs.postgresql;
  name = "harbor-db";
  tag = pkgs.postgresql.version;
  entrypoint = [ "${pkgs.postgresql}/bin/postgres" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
    tzdata
    bash
    coreutils
  ];

  env = {
    PGDATA = "/var/lib/postgresql/data";
  };

  # PostgreSQL runs as postgres user (usually 999)
  user = "999:999";

  labels = {
    "org.opencontainers.image.title" = "Harbor Database";
    "org.opencontainers.image.description" = "PostgreSQL database for Harbor container registry";
    "org.opencontainers.image.version" = pkgs.postgresql.version;
    "io.nix-containers.chart" = "harbor";
  };
}

{ mkImage, pkgs, lib, ... }:

# DuckDB - In-process SQL OLAP database
# https://duckdb.org/

mkImage {
  drv = pkgs.duckdb;
  name = "duckdb";
  tag = "v${pkgs.duckdb.version}";
  entrypoint = [ "${pkgs.duckdb}/bin/duckdb" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "DuckDB";
    "org.opencontainers.image.description" = "In-process SQL OLAP database management system";
    "org.opencontainers.image.version" = pkgs.duckdb.version;
  };
}

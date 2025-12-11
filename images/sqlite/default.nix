{ mkImage, pkgs, lib, ... }:

# SQLite - Lightweight SQL database
# https://www.sqlite.org/

mkImage {
  drv = pkgs.sqlite;
  name = "sqlite";
  tag = "v${pkgs.sqlite.version}";
  entrypoint = [ "${pkgs.sqlite}/bin/sqlite3" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "SQLite";
    "org.opencontainers.image.description" = "Self-contained SQL database engine";
    "org.opencontainers.image.version" = pkgs.sqlite.version;
  };
}

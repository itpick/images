{ mkImage, pkgs, lib, ... }:

# Percona Server - Enhanced MySQL-compatible database
# https://www.percona.com/mysql/software/percona-server-for-mysql

mkImage {
  drv = pkgs.percona-server;
  name = "percona-server";
  tag = "v${pkgs.percona-server.version}";
  entrypoint = [ "${pkgs.percona-server}/bin/mysqld" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Percona Server";
    "org.opencontainers.image.description" = "Enhanced MySQL-compatible database server";
    "org.opencontainers.image.version" = pkgs.percona-server.version;
  };
}

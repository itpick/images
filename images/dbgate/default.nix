{ mkImage, pkgs, lib, ... }:

# DbGate - Database manager for multiple databases
# https://dbgate.org/

mkImage {
  drv = pkgs.dbgate;
  name = "dbgate";
  tag = "v${pkgs.dbgate.version}";
  entrypoint = [ "${pkgs.dbgate}/bin/dbgate" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "DbGate";
    "org.opencontainers.image.description" = "Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, and more";
    "org.opencontainers.image.version" = pkgs.dbgate.version;
  };
}

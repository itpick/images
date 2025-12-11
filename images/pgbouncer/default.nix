{ mkImage, pkgs, lib, ... }:

# PgBouncer - PostgreSQL connection pooler
# https://www.pgbouncer.org/

mkImage {
  drv = pkgs.pgbouncer;
  name = "pgbouncer";
  tag = "v${pkgs.pgbouncer.version}";
  entrypoint = [ "${pkgs.pgbouncer}/bin/pgbouncer" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "PgBouncer";
    "org.opencontainers.image.description" = "Lightweight PostgreSQL connection pooler";
    "org.opencontainers.image.version" = pkgs.pgbouncer.version;
  };
}

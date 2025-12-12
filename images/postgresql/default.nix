{ mkImage, pkgs, lib, ... }:

# PostgreSQL - Relational database
# https://www.postgresql.org/

mkImage {
  drv = pkgs.postgresql;
  name = "postgresql";
  tag = "v${pkgs.postgresql.version}";
  entrypoint = [ "${pkgs.postgresql}/bin/postgres" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "PostgreSQL";
    "org.opencontainers.image.description" = "Powerful, open source object-relational database system";
    "org.opencontainers.image.version" = pkgs.postgresql.version;
  };
}

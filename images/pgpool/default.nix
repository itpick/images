{ buildCLIImage, pkgs, lib, ... }:

# Pgpool-II - Connection pooler and load balancer for PostgreSQL
buildCLIImage {
  drv = pkgs.pgpool;
  name = "pgpool";
  tag = pkgs.pgpool.version;
  entrypoint = [ "${pkgs.pgpool}/bin/pgpool" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Pgpool-II";
    "org.opencontainers.image.description" = "Connection pooler and load balancer for PostgreSQL";
    "org.opencontainers.image.version" = pkgs.pgpool.version;
    "io.nix-containers.chart" = "postgresql-ha";
  };
}

{ mkImage, pkgs, lib, ... }:

# Prometheus PostgreSQL Exporter
# https://github.com/prometheus-community/postgres_exporter

mkImage {
  drv = pkgs.prometheus-postgres-exporter;
  name = "prometheus-postgres-exporter";
  tag = "v${pkgs.prometheus-postgres-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-postgres-exporter}/bin/postgres_exporter" ];
  # Was `--help` (a one-shot). Serve /metrics on 0.0.0.0:9187 with a default
  # DATA_SOURCE_NAME. The exporter connects to its Postgres target per-scrape
  # (not eagerly at startup), so it starts standalone. Operators point it at a
  # real database via DATA_SOURCE_NAME.
  cmd = [ "--web.listen-address=0.0.0.0:9187" ];
  env = {
    DATA_SOURCE_NAME = "postgresql://postgres@localhost:5432/postgres?sslmode=disable";
  };

  extraPkgs = [ pkgs.cacert ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus PostgreSQL Exporter";
    "org.opencontainers.image.description" = "PostgreSQL metrics exporter for Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-postgres-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/prometheus-community/postgres_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "postgres-exporter,postgres_exporter,prometheus";
  };
}

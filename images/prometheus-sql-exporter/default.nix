{ mkImage, pkgs, lib, ... }:

# Prometheus SQL Exporter - Export SQL query results as Prometheus metrics
# https://github.com/free/sql_exporter

let
  # sql_exporter needs a -config.file (it exits without one). Bake a minimal
  # config with one placeholder job pointing at a local Postgres (the Go binary
  # ships no /etc, so no shadowing). sql_exporter connects to the DB lazily on
  # each scrape, so it starts and serves on 0.0.0.0:9399 even though that DB
  # isn't reachable. Operators mount their own config (real connections/queries).
  sqlConfig = pkgs.writeTextDir "etc/sql_exporter/config.yml" ''
    jobs:
    - name: default
      interval: '1m'
      connections:
      - 'postgres://postgres@localhost:5432/postgres?sslmode=disable'
      queries:
      - name: dummy
        help: placeholder query
        values: [value]
        query: 'SELECT 1 AS value'
  '';
in
mkImage {
  drv = pkgs.prometheus-sql-exporter;
  name = "prometheus-sql-exporter";
  tag = "v${pkgs.prometheus-sql-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-sql-exporter}/bin/sql_exporter" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the exporter
  # with the baked config and bind the metrics server on 0.0.0.0:9399 (default
  # is localhost) so the kind-test probe can reach it.
  cmd = [
    "-config.file=/etc/sql_exporter/config.yml"
    "-web.listen-address=0.0.0.0:9399"
  ];

  extraPkgs = [ sqlConfig ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus SQL Exporter";
    "org.opencontainers.image.description" = "Export SQL query results as Prometheus metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-sql-exporter.version;
  };
}

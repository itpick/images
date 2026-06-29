{ mkImage, pkgs, lib, ... }:

# Prometheus MySQL Exporter
# https://github.com/prometheus/mysqld_exporter

let
  # mysqld_exporter (v0.15+) reads the DSN from a my.cnf [client] section
  # (--config.my-cnf), not the old DATA_SOURCE_NAME env. Bake a minimal default
  # pointing at localhost; the exporter connects per-scrape, not at startup, so
  # it starts standalone. Operators mount their own /etc/mysqld_exporter/my.cnf.
  myCnf = pkgs.writeTextDir "etc/mysqld_exporter/my.cnf" ''
    [client]
    user = root
    host = localhost
    port = 3306
  '';

in
mkImage {
  drv = pkgs.prometheus-mysqld-exporter;
  name = "prometheus-mysqld-exporter";
  tag = "v${pkgs.prometheus-mysqld-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-mysqld-exporter}/bin/mysqld_exporter" ];
  # Was `--help` (a one-shot). Serve /metrics on 0.0.0.0:9104 with the baked
  # my.cnf.
  cmd = [
    "--config.my-cnf=/etc/mysqld_exporter/my.cnf"
    "--web.listen-address=0.0.0.0:9104"
  ];

  extraPkgs = [ pkgs.cacert myCnf ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus MySQL Exporter";
    "org.opencontainers.image.description" = "MySQL metrics exporter for Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-mysqld-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/prometheus/mysqld_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "mysqld-exporter,mysqld_exporter,mysql,prometheus";
  };
}

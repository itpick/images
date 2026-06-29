{ mkImage, pkgs, lib, ... }:

# Prometheus PgBouncer Exporter
# https://github.com/prometheus-community/pgbouncer_exporter

let
  # lib/pq resolves the default DB user from the OS user via user.Current() when
  # the DSN omits one, which fails ("unknown userid 65534") because mkImage runs
  # as nobody (65534) and ships no /etc/passwd. Provide a passwd so the lookup
  # succeeds (passwd-only derivation, no /tmp collision with mkImage's layer).
  passwdEnv = pkgs.runCommand "pgbouncer-exporter-passwd" {} ''
    mkdir -p $out/etc
    printf 'root:x:0:0:root:/root:/sbin/nologin\nnobody:x:65534:65534:nobody:/nonexistent:/sbin/nologin\n' > $out/etc/passwd
    printf 'root:x:0:\nnobody:x:65534:\n' > $out/etc/group
  '';

in
mkImage {
  drv = pkgs.prometheus-pgbouncer-exporter;
  name = "prometheus-pgbouncer-exporter";
  tag = "v${pkgs.prometheus-pgbouncer-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-pgbouncer-exporter}/bin/pgbouncer_exporter" ];
  # Was `--help` (a one-shot). Serve /metrics on 0.0.0.0:9127 with a default
  # connection string (user named so lib/pq doesn't need user.Current()).
  # sql.Open is lazy, so the exporter connects to PgBouncer only on scrape — it
  # starts standalone. Operators point it at a real PgBouncer.
  cmd = [
    "--pgBouncer.connectionString=postgres://pgbouncer@localhost:6432/pgbouncer?sslmode=disable"
    "--web.listen-address=0.0.0.0:9127"
  ];

  extraPkgs = [ pkgs.cacert passwdEnv ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus PgBouncer Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for PgBouncer metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-pgbouncer-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/prometheus-community/pgbouncer_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "pgbouncer-exporter,pgbouncer_exporter,prometheus";
  };
}

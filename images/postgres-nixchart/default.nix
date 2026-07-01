{ mkImage, pkgs, lib, nonRoot, ... }:

# postgres-nixchart
# =================
# PostgreSQL image sized for consumption by the charts/postgresql chart.
#
# Contract with the chart:
#   - Binary at $out/bin/postgres and $out/bin/initdb (from pkgs.postgresql)
#   - Entrypoint: /docker-entrypoint.sh
#   - Consumes standard env vars (POSTGRES_{USER,PASSWORD,DB,INITDB_ARGS})
#     plus optional PGDATA for the data directory.
#   - Data at /var/lib/postgresql/data (writable, non-root safe)
#   - Listens on 5432 by default; override with PGPORT env var
#
# Kept intentionally small — no LDAP, no built-in replication logic,
# no custom init hooks beyond the standard /docker-entrypoint-initdb.d/
# convention (users mount their own initdb scripts there).

let
  version = pkgs.postgresql.version;
  entrypoint = pkgs.writeShellScript "postgres-entrypoint" ''
    set -euo pipefail

    export PGDATA="''${PGDATA:-/var/lib/postgresql/data}"
    export POSTGRES_USER="''${POSTGRES_USER:-postgres}"
    export POSTGRES_DB="''${POSTGRES_DB:-$POSTGRES_USER}"

    mkdir -p "$PGDATA"

    # First-run initdb when the data dir is empty.
    if [ -z "$(ls -A "$PGDATA" 2>/dev/null)" ]; then
      if [ -z "''${POSTGRES_PASSWORD:-}" ] && [ "''${POSTGRES_HOST_AUTH_METHOD:-}" != "trust" ]; then
        echo "postgres-nixchart: POSTGRES_PASSWORD is required (or set POSTGRES_HOST_AUTH_METHOD=trust)" >&2
        exit 1
      fi

      # initdb wants POSTGRES_INITDB_ARGS as a single string of flags.
      # shellcheck disable=SC2086
      ${pkgs.postgresql}/bin/initdb \
        --username="$POSTGRES_USER" \
        --pwfile=<(printf '%s' "''${POSTGRES_PASSWORD:-}") \
        ''${POSTGRES_INITDB_ARGS:-} \
        --pgdata="$PGDATA"

      # Optional: create additional database if POSTGRES_DB != POSTGRES_USER
      if [ "$POSTGRES_DB" != "$POSTGRES_USER" ]; then
        ${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -w start
        ${pkgs.postgresql}/bin/psql -U "$POSTGRES_USER" -d postgres \
          -c "CREATE DATABASE \"$POSTGRES_DB\";"
        ${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -w stop
      fi

      # Run any *.sql / *.sh scripts users mounted at /docker-entrypoint-initdb.d/
      if [ -d /docker-entrypoint-initdb.d ]; then
        ${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -w start
        for f in /docker-entrypoint-initdb.d/*; do
          case "$f" in
            *.sql)    ${pkgs.postgresql}/bin/psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$f" ;;
            *.sql.gz) gunzip -c "$f" | ${pkgs.postgresql}/bin/psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" ;;
            *.sh)     ${pkgs.bash}/bin/bash "$f" ;;
          esac
        done
        ${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -w stop
      fi
    fi

    exec ${pkgs.postgresql}/bin/postgres \
      -D "$PGDATA" \
      -c listen_addresses='*' \
      "$@"
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "postgres-nixchart-env";
    paths = with pkgs; [
      postgresql
      bash
      coreutils
      cacert
      tzdata
      gnugrep
      gnused
      gawk
    ];
  };

  name = "postgres-nixchart";
  tag = "v${version}";

  entrypoint = [ "${entrypoint}" ];
  cmd = [];

  extraPkgs = [ ];

  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "postgres-nixchart";
    "org.opencontainers.image.description" = "PostgreSQL image tuned for the nix-containers charts/postgresql chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "postgresql";
  };
}

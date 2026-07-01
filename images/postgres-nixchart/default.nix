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

    # PGDATA defaults to /tmp/pgdata so a bare `docker run` / kind smoke
    # test can initdb without a mounted PV. The chart overrides via env
    # (StatefulSet PVC at /bitnami/postgresql or similar).
    export PGDATA="''${PGDATA:-/tmp/pgdata}"
    export POSTGRES_USER="''${POSTGRES_USER:-postgres}"
    export POSTGRES_DB="''${POSTGRES_DB:-$POSTGRES_USER}"

    mkdir -p "$PGDATA"

    # First-run initdb when the data dir is empty.
    if [ -z "$(ls -A "$PGDATA" 2>/dev/null)" ]; then
      # First-run: default to trust auth so smoke tests work without a
      # password. The chart overrides via POSTGRES_HOST_AUTH_METHOD=md5
      # + a POSTGRES_PASSWORD secret when it wants real auth.
      AUTH_METHOD="''${POSTGRES_HOST_AUTH_METHOD:-trust}"

      # initdb wants POSTGRES_INITDB_ARGS as a single string of flags.
      # shellcheck disable=SC2086
      if [ -n "''${POSTGRES_PASSWORD:-}" ]; then
        ${pkgs.postgresql}/bin/initdb \
          --username="$POSTGRES_USER" \
          --auth="$AUTH_METHOD" \
          --pwfile=<(printf '%s' "$POSTGRES_PASSWORD") \
          ''${POSTGRES_INITDB_ARGS:-} \
          --pgdata="$PGDATA"
      else
        ${pkgs.postgresql}/bin/initdb \
          --username="$POSTGRES_USER" \
          --auth="$AUTH_METHOD" \
          ''${POSTGRES_INITDB_ARGS:-} \
          --pgdata="$PGDATA"
      fi

      # Socket dir override for pg_ctl during first-run bootstrap; matches
      # what the exec below uses so both hit /tmp instead of /run/postgresql
      # (which isn't writable in this image).
      SOCK="''${POSTGRES_UNIX_SOCKET_DIR:-/tmp}"

      # Optional: create additional database if POSTGRES_DB != POSTGRES_USER
      if [ "$POSTGRES_DB" != "$POSTGRES_USER" ]; then
        ${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -o "-c unix_socket_directories=$SOCK" -w start
        ${pkgs.postgresql}/bin/psql -h "$SOCK" -U "$POSTGRES_USER" -d postgres \
          -c "CREATE DATABASE \"$POSTGRES_DB\";"
        ${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -w stop
      fi

      # Run any *.sql / *.sh scripts users mounted at /docker-entrypoint-initdb.d/
      if [ -d /docker-entrypoint-initdb.d ]; then
        ${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -o "-c unix_socket_directories=$SOCK" -w start
        for f in /docker-entrypoint-initdb.d/*; do
          case "$f" in
            *.sql)    ${pkgs.postgresql}/bin/psql -h "$SOCK" -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$f" ;;
            *.sql.gz) gunzip -c "$f" | ${pkgs.postgresql}/bin/psql -h "$SOCK" -U "$POSTGRES_USER" -d "$POSTGRES_DB" ;;
            *.sh)     ${pkgs.bash}/bin/bash "$f" ;;
          esac
        done
        ${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -w stop
      fi
    fi

    # unix_socket_directories default of /run/postgresql isn't writable
    # in this image; chart pods can override via POSTGRES_UNIX_SOCKET_DIR.
    exec ${pkgs.postgresql}/bin/postgres \
      -D "$PGDATA" \
      -c listen_addresses='*' \
      -c unix_socket_directories="''${POSTGRES_UNIX_SOCKET_DIR:-/tmp}" \
      "$@"
  '';

  # initdb refuses to run when getpwuid() has no entry for the effective
  # UID. Ship a minimal /etc/passwd + /etc/group so postgres:1001 resolves.
  # The chart's k8s pod securityContext usually solves this via fsGroup,
  # but standalone `docker run` and kind smoke tests don't get that.
  passwdEntry = pkgs.runCommand "postgres-nixchart-passwd" {} ''
    mkdir -p $out/etc
    cat > $out/etc/passwd <<'EOF'
    root:x:0:0:root:/root:/bin/bash
    postgres:x:1001:0:postgres:/var/lib/postgresql:/bin/bash
    EOF
    cat > $out/etc/group <<'EOF'
    root:x:0:
    EOF
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "postgres-nixchart-env";
    paths = with pkgs; [
      postgresql
      passwdEntry
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

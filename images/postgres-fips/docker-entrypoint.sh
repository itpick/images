#!/usr/bin/env bash
# postgres-fips docker-entrypoint.sh
#
# Honors the docker-library postgres convention enough for drop-in use:
#   POSTGRES_DB                — initial database name (defaults to POSTGRES_USER)
#   POSTGRES_USER              — superuser to create (defaults to "postgres")
#   POSTGRES_PASSWORD          — superuser password (required on first init)
#   PGDATA                     — data directory (defaults to /var/lib/postgresql/data)
#   POSTGRES_INITDB_ARGS       — extra args appended to initdb (string, split on spaces)
#   POSTGRES_HOST_AUTH_METHOD  — pg_hba host auth method (defaults to scram-sha-256)
#
# On first run with an empty PGDATA, runs initdb, creates the database
# named POSTGRES_DB, then executes /docker-entrypoint-initdb.d/*.{sh,sql,sql.gz}
# in alphabetical order. Subsequent runs skip initdb.
#
# Runs as the postgres user (uid 999) — set as the image's default User
# and applied to PGDATA + /var/run/postgresql at image-build time. No
# runtime chown is needed, so the image works under hardened compose
# stacks that drop CAP_CHOWN.
set -euo pipefail

POSTGRES_USER="${POSTGRES_USER:-postgres}"
POSTGRES_DB="${POSTGRES_DB:-$POSTGRES_USER}"
PGDATA="${PGDATA:-/var/lib/postgresql/data}"
POSTGRES_HOST_AUTH_METHOD="${POSTGRES_HOST_AUTH_METHOD:-scram-sha-256}"
POSTGRES_INITDB_ARGS="${POSTGRES_INITDB_ARGS:-}"

# Pin the Unix socket directory. postgres' compile-time default is
# /run/postgresql, but this image only ships /var/run/postgresql (pre-baked
# at the right ownership). Without this pin postgres FATALs with
# 'could not create lock file "/run/postgresql/.s.PGSQL.5432.lock"'.
PG_SOCKET_DIR=/var/run/postgresql

initialize_db() {
  if [ -z "${POSTGRES_PASSWORD:-}" ]; then
    echo "FATAL: POSTGRES_PASSWORD must be set on first run (empty PGDATA at $PGDATA)" >&2
    exit 1
  fi

  echo "[entrypoint] running initdb in $PGDATA (user=$POSTGRES_USER)"
  local pwfile=$PG_SOCKET_DIR/.pwfile.$$
  printf '%s' "$POSTGRES_PASSWORD" > "$pwfile"
  chmod 600 "$pwfile"
  # shellcheck disable=SC2086  # intentional word-split on POSTGRES_INITDB_ARGS
  initdb \
    --username="$POSTGRES_USER" \
    --pwfile="$pwfile" \
    --auth-host="$POSTGRES_HOST_AUTH_METHOD" \
    --auth-local=trust \
    -D "$PGDATA" \
    $POSTGRES_INITDB_ARGS
  rm -f "$pwfile"

  # Allow remote connections (compose networking).
  echo "host all all all $POSTGRES_HOST_AUTH_METHOD" >> "$PGDATA/pg_hba.conf"

  # Start temp instance on Unix socket only for setup. Also export PGHOST
  # so local psql/pg_isready calls find the socket (their default is
  # postgres' compile-time /run/postgresql which doesn't exist here).
  pg_ctl -D "$PGDATA" -o "-c listen_addresses='' -c unix_socket_directories=$PG_SOCKET_DIR" -w start
  export PGHOST="$PG_SOCKET_DIR"

  # Create the application DB. initdb only creates template0/1 and postgres,
  # NOT a database named after the superuser — so we must always create
  # POSTGRES_DB (unless it's "postgres", which initdb already made).
  if [ "$POSTGRES_DB" != "postgres" ]; then
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres \
      -c "CREATE DATABASE \"$POSTGRES_DB\";"
  fi

  # Run /docker-entrypoint-initdb.d/ in alphabetical order.
  if [ -d /docker-entrypoint-initdb.d ]; then
    for f in /docker-entrypoint-initdb.d/*; do
      [ -e "$f" ] || continue
      case "$f" in
        *.sh)
          echo "[entrypoint] sourcing $f"
          # shellcheck disable=SC1090
          . "$f"
          ;;
        *.sql)
          echo "[entrypoint] applying $f"
          psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f "$f"
          ;;
        *.sql.gz)
          echo "[entrypoint] applying $f"
          gunzip -c "$f" | psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"
          ;;
        *)
          echo "[entrypoint] ignoring $f"
          ;;
      esac
    done
  fi

  pg_ctl -D "$PGDATA" -m fast -w stop
  echo "[entrypoint] init complete"
}

if [ ! -s "$PGDATA/PG_VERSION" ]; then
  initialize_db
fi

# Default command is "postgres". If the caller passes their own command, exec it.
if [ "$#" = "0" ] || [ "$1" = "postgres" ]; then
  exec postgres -D "$PGDATA" -c "unix_socket_directories=$PG_SOCKET_DIR"
fi
exec "$@"

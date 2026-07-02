#!/usr/bin/env bash
# postgres docker-entrypoint.sh
#
# docker-library-compatible entrypoint so the image runs a server with no
# args. Honors the usual env:
#   POSTGRES_DB                — initial database name (defaults to POSTGRES_USER)
#   POSTGRES_USER              — superuser to create (defaults to "postgres")
#   POSTGRES_PASSWORD          — superuser password (optional; trust auth if unset)
#   PGDATA                     — data directory (defaults to /var/lib/postgresql/data)
#   POSTGRES_INITDB_ARGS       — extra args appended to initdb (split on spaces)
#   POSTGRES_HOST_AUTH_METHOD  — pg_hba host auth (default scram-sha-256, or
#                                "trust" when no password is set)
#
# This image runs as root. initdb/postgres refuse to run as root, so on first
# boot we chown PGDATA to the postgres uid and re-exec the server via gosu.
# On an empty PGDATA we initdb, create POSTGRES_DB, and run any
# /docker-entrypoint-initdb.d/*.{sh,sql,sql.gz} in alphabetical order.
set -euo pipefail

POSTGRES_USER="${POSTGRES_USER:-postgres}"
POSTGRES_DB="${POSTGRES_DB:-$POSTGRES_USER}"
PGDATA="${PGDATA:-/var/lib/postgresql/data}"
POSTGRES_INITDB_ARGS="${POSTGRES_INITDB_ARGS:-}"
export PGDATA

# Unix socket dir. postgres' compile-time default is /run/postgresql which we
# pre-create writable in the image; pin it so pg_isready/psql find the socket.
PG_SOCKET_DIR=/var/run/postgresql

# OS user/uid that owns PGDATA and runs the server (postgres can't run as root).
PG_RUN_UID=999
PG_RUN_GID=999

# If no password is provided, default host auth to trust so the container comes
# up unattended (kind/compose smoke tests just need a running server).
if [ -z "${POSTGRES_PASSWORD:-}" ]; then
  POSTGRES_HOST_AUTH_METHOD="${POSTGRES_HOST_AUTH_METHOD:-trust}"
else
  POSTGRES_HOST_AUTH_METHOD="${POSTGRES_HOST_AUTH_METHOD:-scram-sha-256}"
fi

# Drop to the postgres uid for a command when we're currently root.
as_postgres() {
  if [ "$(id -u)" = "0" ]; then
    gosu "$PG_RUN_UID:$PG_RUN_GID" "$@"
  else
    "$@"
  fi
}

initialize_db() {
  echo "[entrypoint] running initdb in $PGDATA (user=$POSTGRES_USER)"

  local initdb_args=(
    --username="$POSTGRES_USER"
    --auth-host="$POSTGRES_HOST_AUTH_METHOD"
    --auth-local=trust
    -D "$PGDATA"
  )

  local pwfile=""
  if [ -n "${POSTGRES_PASSWORD:-}" ]; then
    pwfile="$PG_SOCKET_DIR/.pwfile.$$"
    printf '%s' "$POSTGRES_PASSWORD" > "$pwfile"
    chmod 600 "$pwfile"
    if [ "$(id -u)" = "0" ]; then
      chown "$PG_RUN_UID:$PG_RUN_GID" "$pwfile"
    fi
    initdb_args+=(--pwfile="$pwfile")
  fi

  # shellcheck disable=SC2086  # intentional word-split on POSTGRES_INITDB_ARGS
  as_postgres initdb "${initdb_args[@]}" $POSTGRES_INITDB_ARGS
  [ -n "$pwfile" ] && rm -f "$pwfile"

  # Allow remote connections (pod/compose networking).
  echo "host all all all $POSTGRES_HOST_AUTH_METHOD" >> "$PGDATA/pg_hba.conf"

  # Temp instance on the Unix socket only, to create the app DB + run init.d.
  as_postgres pg_ctl -D "$PGDATA" \
    -o "-c listen_addresses='' -c unix_socket_directories=$PG_SOCKET_DIR" -w start
  export PGHOST="$PG_SOCKET_DIR"

  # initdb does not create a DB named after the superuser, so create POSTGRES_DB
  # unless it's "postgres" (already created by initdb).
  if [ "$POSTGRES_DB" != "postgres" ]; then
    as_postgres psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres \
      -c "CREATE DATABASE \"$POSTGRES_DB\";"
  fi

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
          as_postgres psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f "$f"
          ;;
        *.sql.gz)
          echo "[entrypoint] applying $f"
          gunzip -c "$f" | as_postgres psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"
          ;;
        *)
          echo "[entrypoint] ignoring $f"
          ;;
      esac
    done
  fi

  as_postgres pg_ctl -D "$PGDATA" -m fast -w stop
  echo "[entrypoint] init complete"
}

# Pass non-server invocations straight through (e.g. `postgres --version`,
# `postgres --help`, `psql ...`, `initdb --version`) without touching PGDATA.
# Only "postgres" with no extra args (or no command at all) starts the server.
if [ "$#" -gt 1 ] || { [ "$#" = "1" ] && [ "$1" != "postgres" ]; }; then
  exec "$@"
fi

# Server start path. Ensure PGDATA + socket dir exist and are owned by the
# postgres uid (this image runs as root, so chown is allowed here).
mkdir -p "$PGDATA" "$PG_SOCKET_DIR"
if [ "$(id -u)" = "0" ]; then
  chown -R "$PG_RUN_UID:$PG_RUN_GID" "$PGDATA" "$PG_SOCKET_DIR"
fi
chmod 700 "$PGDATA"

if [ ! -s "$PGDATA/PG_VERSION" ]; then
  initialize_db
fi

# listen_addresses='*' matches docker-library so cross-container TCP works.
# Re-exec the server as the postgres uid (exec can't run a shell function, so
# inline the gosu drop here).
if [ "$(id -u)" = "0" ]; then
  exec gosu "$PG_RUN_UID:$PG_RUN_GID" postgres -D "$PGDATA" \
    -c "unix_socket_directories=$PG_SOCKET_DIR" \
    -c "listen_addresses=*"
fi
exec postgres -D "$PGDATA" \
  -c "unix_socket_directories=$PG_SOCKET_DIR" \
  -c "listen_addresses=*"

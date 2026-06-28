#!/usr/bin/env bash
# mariadb docker-entrypoint.sh
#
# docker-library-compatible entrypoint so the image runs a server with no
# args. Honors a minimal slice of the usual env:
#   MARIADB_DATA_DIR — data directory (defaults to /var/lib/mysql)
#
# This image runs as root. The data dir must be owned by the mysql uid and
# mariadbd should not run as root, so on first boot we chown the data/socket
# dirs to the mysql uid, run mariadb-install-db, and re-exec mariadbd via gosu.
# Root comes up passwordless (kind/compose smoke tests just need a running,
# reachable server); password/initial-DB provisioning can be layered on later.
set -euo pipefail

DATADIR="${MARIADB_DATA_DIR:-/var/lib/mysql}"
SOCKET_DIR=/run/mysqld
SOCKET="$SOCKET_DIR/mysqld.sock"
PIDFILE="$SOCKET_DIR/mysqld.pid"

# OS user/uid that owns the data dir and runs the server.
MYSQL_RUN_UID=999
MYSQL_RUN_GID=999

# Pass non-server invocations straight through (e.g. `mariadbd --version`,
# `mariadb ...`, `mariadb-install-db ...`). Only a bare "mariadbd" (or no
# command) starts the managed server.
if [ "$#" -gt 1 ] || { [ "$#" = "1" ] && [ "$1" != "mariadbd" ]; }; then
  exec "$@"
fi

# Drop to the mysql uid for a command when we're currently root.
as_mysql() {
  if [ "$(id -u)" = "0" ]; then
    gosu "$MYSQL_RUN_UID:$MYSQL_RUN_GID" "$@"
  else
    "$@"
  fi
}

# Ensure the data + socket dirs exist and are owned by the mysql uid (this
# image runs as root, so chown is allowed here).
mkdir -p "$DATADIR" "$SOCKET_DIR"
if [ "$(id -u)" = "0" ]; then
  chown -R "$MYSQL_RUN_UID:$MYSQL_RUN_GID" "$DATADIR" "$SOCKET_DIR"
fi
chmod 700 "$DATADIR"

# First boot: initialize the system tables. A populated data dir always has a
# `mysql` system database directory.
if [ ! -d "$DATADIR/mysql" ]; then
  echo "[entrypoint] initializing MariaDB data dir at $DATADIR"
  as_mysql mariadb-install-db \
    --datadir="$DATADIR" \
    --auth-root-authentication-method=normal \
    --skip-test-db \
    --skip-name-resolve
fi

# Server start path. mariadbd binds all interfaces so it is reachable by the
# kind-test probe / in-cluster clients. exec can't run a shell function, so the
# gosu drop is inlined here (mirrors images/postgres).
echo "[entrypoint] starting mariadbd"
if [ "$(id -u)" = "0" ]; then
  exec gosu "$MYSQL_RUN_UID:$MYSQL_RUN_GID" mariadbd \
    --datadir="$DATADIR" \
    --socket="$SOCKET" \
    --pid-file="$PIDFILE" \
    --bind-address=0.0.0.0 \
    --port=3306
fi
exec mariadbd \
  --datadir="$DATADIR" \
  --socket="$SOCKET" \
  --pid-file="$PIDFILE" \
  --bind-address=0.0.0.0 \
  --port=3306

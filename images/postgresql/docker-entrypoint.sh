#!/usr/bin/env bash
set -euo pipefail

# PostgreSQL needs `initdb` to create its data directory before `postgres` can
# run it. Init on first boot (idempotent — skip if PG_VERSION already exists, so
# a mounted volume survives restarts), then exec the server.
#
# This image runs as the nonroot user (65534); postgres refuses to run only as
# *root*, so that's fine (a baked /etc/passwd entry makes getpwuid(65534)
# resolve). PGDATA and the Unix-socket dir live under the writable /tmp, and
# listen_addresses=0.0.0.0 makes the server reachable by the kind-test probe.
# --auth=trust lets the bare image accept connections with no password;
# operators mount a PVC at PGDATA and set a real password for production.
export PGDATA="${PGDATA:-/tmp/pgdata}"

if [ ! -s "$PGDATA/PG_VERSION" ]; then
  initdb --username=postgres --auth=trust -D "$PGDATA"
fi

exec postgres -D "$PGDATA" \
  -c listen_addresses=0.0.0.0 \
  -c unix_socket_directories=/tmp

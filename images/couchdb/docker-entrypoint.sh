#!/usr/bin/env bash
set -euo pipefail

# CouchDB (Erlang) needs several writable locations that its defaults put on the
# read-only root, so it CrashLoops bare:
#  - $HOME/.erlang.cookie (Erlang distribution cookie) — HOME is "/" (read-only)
#  - the database/view dirs
#  - local.ini, which CouchDB rewrites at runtime (it hashes the plaintext admin
#    password on first boot)
# Point HOME + the data dir at the writable /tmp, and copy the baked read-only
# local.ini (which sets an admin, the /tmp data dirs, and bind 0.0.0.0:5984) to
# a writable spot so CouchDB can persist the hashed password. Then exec couchdb
# with the package default.ini + our writable local.ini.
export HOME="${COUCHDB_HOME:-/tmp/couchdb/home}"
DATA_DIR="${COUCHDB_DATA_DIR:-/tmp/couchdb/data}"
mkdir -p "$HOME" "$DATA_DIR"

if [ ! -f /tmp/couchdb/local.ini ]; then
  cp /etc/couchdb/local.ini /tmp/couchdb/local.ini
fi

exec couchdb -couch_ini "$COUCHDB_DEFAULT_INI" /tmp/couchdb/local.ini

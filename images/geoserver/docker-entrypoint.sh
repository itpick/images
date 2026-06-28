#!/usr/bin/env bash
# geoserver docker-entrypoint.sh
#
# GeoServer needs a writable data directory, but the packaged default
# ($GEOSERVER_HOME/data_dir) is a read-only nix store path. Seed a writable
# copy under /tmp on first boot, then exec the foreground launcher. The
# GeoServer log lives under the (writable) data dir and Jetty's tmp is /tmp,
# so nothing tries to write back into the store. Operators override by setting
# GEOSERVER_DATA_DIR / mounting their own data dir.
set -euo pipefail

# Pass non-server invocations straight through (e.g. `--version`, `--help`, a
# shell) so probes don't start the long-running server. Only a bare entrypoint
# (no args) launches GeoServer.
if [ "$#" -gt 0 ]; then
  exec "$@"
fi

export GEOSERVER_DATA_DIR="${GEOSERVER_DATA_DIR:-/tmp/geoserver/data}"
mkdir -p "$GEOSERVER_DATA_DIR"

if [ -z "$(ls -A "$GEOSERVER_DATA_DIR" 2>/dev/null)" ] && [ -d "${GEOSERVER_HOME:-}/data_dir" ]; then
  echo "[entrypoint] seeding GeoServer data dir at $GEOSERVER_DATA_DIR"
  cp -r "$GEOSERVER_HOME"/data_dir/. "$GEOSERVER_DATA_DIR"/
  chmod -R u+w "$GEOSERVER_DATA_DIR"
fi

exec geoserver-startup

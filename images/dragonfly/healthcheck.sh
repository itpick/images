#!/bin/sh
# Drop-in compat copy of the upstream docker.dragonflydb.io/dragonflydb/dragonfly
# healthcheck.sh (issue #5844 cleanup pattern + auto port detection).
# The dragonfly helm chart's probes exec /usr/local/bin/healthcheck.sh verbatim,
# so this script's path + filename are load-bearing.
cleanup() {
  wait 2>/dev/null || true
}
trap cleanup EXIT

HOST="localhost"
PORT=$HEALTHCHECK_PORT

if [ -z "$HEALTHCHECK_PORT" ]; then
  DF_NET=$(netstat -tlnp 2>/dev/null | grep "/dragonfly")
  if [ -z "$DF_NET" ]; then
    DF_NET=$(su dfly -c "netstat -tlnp" 2>/dev/null | grep "/dragonfly")
  fi
  PORT=$(echo $DF_NET | grep -oE ':[0-9]+' | cut -c2- | tail -n 1)
fi

# Busybox nc (shipped via mkImage's default base layer) doesn't grok
# `-q` (used in the upstream OpenBSD-nc-based image) but does support
# `-w` for I/O timeout. Functionally equivalent for our use: write
# "PING", wait briefly for a response, exit on the nc return code.
_healthcheck="nc -w1 $HOST $PORT"
echo PING | ${_healthcheck}
exit $?

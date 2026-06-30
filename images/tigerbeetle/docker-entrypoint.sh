#!/usr/bin/env bash
set -euo pipefail

# TigerBeetle needs a one-time `format` to create its replica data file before
# `start` can run it. Format on first boot (idempotent — skip if the data file
# already exists, so a mounted volume survives restarts), then exec the server.
# --development relaxes the production Direct-I/O / filesystem requirements so it
# runs on a container overlay/tmpfs. A single replica (replica-count=1) needs no
# cluster peers. Operators mount a PVC at the data dir and can override the
# addresses/cluster/data-file via the TIGERBEETLE_* env vars.
DATA_FILE="${TIGERBEETLE_DATA_FILE:-/tmp/tigerbeetle/0_0.tigerbeetle}"
ADDRESSES="${TIGERBEETLE_ADDRESSES:-0.0.0.0:3000}"
CLUSTER="${TIGERBEETLE_CLUSTER:-0}"

mkdir -p "$(dirname "$DATA_FILE")"

if [ ! -f "$DATA_FILE" ]; then
  tigerbeetle format \
    --cluster="$CLUSTER" --replica=0 --replica-count=1 --development \
    "$DATA_FILE"
fi

exec tigerbeetle start \
  --addresses="$ADDRESSES" --development \
  "$DATA_FILE"

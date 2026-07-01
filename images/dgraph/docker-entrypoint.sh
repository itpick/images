#!/usr/bin/env bash
set -euo pipefail

# Dgraph is a two-process graph database: `dgraph zero` is the cluster
# coordinator and `dgraph alpha` is the data node. Run both in one container
# (the upstream "standalone" layout): start zero in the background, wait for it,
# then exec alpha as PID 1. Both write their WAL/postings dirs relative to the
# working dir, so cd into the writable /tmp first (the nonroot pod's root is
# read-only). alpha serves HTTP on :8080 and gRPC on :9080 (all interfaces).
# --security whitelist opens the admin endpoints for the bare image; operators
# lock this down, mount a PVC at the data dir, and run zero/alpha separately.
DATA_DIR="${DGRAPH_DATA_DIR:-/tmp/dgraph}"
mkdir -p "$DATA_DIR"
cd "$DATA_DIR"

dgraph zero --my=localhost:5080 &

# Wait (up to ~30s) for zero's gRPC port to accept connections before starting
# alpha (pure-bash /dev/tcp probe — no external tools needed). alpha also
# retries the --zero connection on its own, so this is just to avoid noise.
for _ in $(seq 1 60); do
  if (exec 3<>/dev/tcp/localhost/5080) 2>/dev/null; then
    exec 3>&-
    break
  fi
  sleep 0.5
done

exec dgraph alpha --my=localhost:7080 --zero=localhost:5080 --security whitelist=0.0.0.0/0

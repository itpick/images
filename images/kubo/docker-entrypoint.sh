#!/usr/bin/env bash
set -euo pipefail

# Kubo (go-ipfs) needs a one-time `ipfs init` to create its repo before
# `ipfs daemon` can run. Init on first boot (idempotent — skip if the repo
# already exists, so a mounted volume survives restarts), then exec the daemon.
#
# IPFS_PATH points the repo at the writable /tmp ($HOME/.ipfs is not writable in
# the nonroot pod). The `server` init profile disables local-network discovery
# (mDNS), which is appropriate for a datacenter/CI node. Expose the read-only
# content Gateway on all interfaces so it is reachable; the full-control RPC API
# (Addresses.API) is intentionally left on its 127.0.0.1 default — exposing it
# would grant unauthenticated control of the node. Operators mount a PVC at
# IPFS_PATH and, if they need remote management, set Addresses.API themselves.
export IPFS_PATH="${IPFS_PATH:-/tmp/ipfs}"

if [ ! -f "$IPFS_PATH/config" ]; then
  ipfs init --profile server
  ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
fi

exec ipfs daemon --migrate=true

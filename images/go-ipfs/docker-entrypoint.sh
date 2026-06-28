#!/usr/bin/env bash
# go-ipfs (Kubo) docker-entrypoint.sh
#
# Initialize the IPFS repo on first boot, then run the daemon. The repo lives
# under writable /tmp (buildEnv leaves the user's home read-only), and the API
# + gateway bind all interfaces so they're reachable in-cluster. Operators
# override by setting IPFS_PATH / mounting an existing repo.
set -euo pipefail

export IPFS_PATH="${IPFS_PATH:-/tmp/ipfs}"

# Anything other than the bare server start passes through to ipfs
# (e.g. `ipfs --version`, `ipfs id`).
if [ "$#" -gt 0 ] && [ "$1" != "daemon" ]; then
  exec ipfs "$@"
fi

mkdir -p "$IPFS_PATH"
if [ ! -f "$IPFS_PATH/config" ]; then
  echo "[entrypoint] ipfs init (server profile) in $IPFS_PATH"
  ipfs init --profile server >/dev/null
fi

# Reachable API + gateway (default binds 127.0.0.1 only).
ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080

exec ipfs daemon --migrate=true

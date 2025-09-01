# Valkey

A high-performance data structure server, open-source fork of Redis

## Description

Valkey is a high-performance data structure server that primarily serves key/value workloads. It is an open-source fork of Redis maintained by the Linux Foundation. This container image provides a complete Valkey server with enhanced security features including non-root execution and minimal attack surface. Valkey supports all Redis features including pub/sub, transactions, Lua scripting, and various data structures like strings, hashes, lists, sets, and sorted sets.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/valkey:latest

# Run Valkey server
docker run -d --name valkey \
  -p 6379:6379 \
  ghcr.io/nix-containers/images/valkey:latest

# Connect with valkey-cli
docker run -it --rm --link valkey:server \
  ghcr.io/nix-containers/images/valkey:latest \
  valkey-cli -h server

# Run with custom configuration
docker run -d --name valkey \
  -v /host/valkey.conf:/home/nonroot/valkey.conf \
  -p 6379:6379 \
  ghcr.io/nix-containers/images/valkey:latest \
  valkey-server /home/nonroot/valkey.conf
```

### Build Locally with Nix

```bash
# Build the image
nix build .#valkey

# Load to Docker
nix run .#valkey.copyTo -- docker-daemon:valkey:latest

# Run tests
nix run .#valkey-test
```

## What's Included

- Valkey server and client tools
- valkey-cli command-line interface
- valkey-benchmark performance testing tool
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security
- Standard port 6379 exposed

## Upstream

- https://valkey.io/
- https://github.com/valkey-io/valkey
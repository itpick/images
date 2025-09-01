# Redis

A container image with Redis in-memory data structure store.

## Description

This image provides Redis, an open-source, in-memory data structure store used as a database, cache, and message broker. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for caching, session storage, or real-time applications.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/redis:latest

# Run Redis server
docker run -d --name redis -p 6379:6379 ghcr.io/nix-containers/images/redis:latest redis-server

# Connect to Redis CLI
docker exec -it redis redis-cli

# Run with persistent storage
docker run -d --name redis \
  -p 6379:6379 \
  -v redis_data:/data \
  ghcr.io/nix-containers/images/redis:latest redis-server --appendonly yes
```

### Build Locally with Nix

```bash
# Build the image
nix build .#redis

# Load to Docker
nix run .#redis.copyTo -- docker-daemon:redis:latest

# Run tests
nix run .#redis-test
```

## What's Included

- Redis server - in-memory data structure store
- Redis CLI - command-line interface
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Exposed port 6379

## Upstream

- **Redis**: https://redis.io/
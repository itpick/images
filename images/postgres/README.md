# PostgreSQL

A container image with PostgreSQL database server and client tools.

## Description

This image provides PostgreSQL database server with full client tools, utilities, and extensions support. Designed for both development and production use with proper security configurations and a non-root user setup (UID 1000).

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/postgres:latest

# Run PostgreSQL server
docker run -d --name postgres \
  -e POSTGRES_PASSWORD=mypassword \
  -p 5432:5432 \
  ghcr.io/nix-containers/images/postgres:latest

# Connect with psql client
docker run -it --rm --link postgres \
  ghcr.io/nix-containers/images/postgres:latest \
  psql -h postgres -U postgres

# Check PostgreSQL version
docker run --rm ghcr.io/nix-containers/images/postgres:latest postgres --version
```

### Build Locally with Nix

```bash
# Build the image
nix build .#postgres

# Load to Docker
nix run .#postgres.copyTo -- docker-daemon:postgres:latest

# Run tests
nix run .#postgres-test
```

## What's Included

- PostgreSQL database server
- psql command-line client
- pg_dump, pg_restore, and other utilities
- Database administration tools
- Extensions support
- Non-root user environment (UID 1000)

## Upstream

- **PostgreSQL**: https://www.postgresql.org/
- **PostgreSQL Documentation**: https://www.postgresql.org/docs/
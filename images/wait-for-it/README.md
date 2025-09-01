# Wait-for-it

A container image with wait-for-it script for waiting on service availability.

## Description

This image provides the wait-for-it script, a pure bash utility for testing and waiting on the availability of TCP hosts and ports. Commonly used in Docker Compose setups to ensure services are ready before starting dependent containers.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/wait-for-it:latest

# Wait for a service
docker run --rm ghcr.io/nix-containers/images/wait-for-it:latest wait-for-it hostname:port --timeout=60

# Wait and execute command
docker run --rm ghcr.io/nix-containers/images/wait-for-it:latest wait-for-it db:5432 -- echo "Database is ready"
```

### Build Locally with Nix

```bash
# Build the image
nix build .#wait-for-it

# Load to Docker
nix run .#wait-for-it.copyTo -- docker-daemon:wait-for-it:latest

# Run tests
nix run .#wait-for-it-test
```

## What's Included

- wait-for-it script
- Bash shell
- Core networking utilities
- Non-root user environment (UID 1000)

## Upstream

- **wait-for-it**: https://github.com/vishnubob/wait-for-it
# Attic

A container image with Attic binary cache for Nix.

## Description

This image provides Attic, a self-hostable binary cache for Nix with S3 backend support. Designed for organizations wanting to host their own Nix binary cache with a non-root user setup (UID 1000).

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/attic:latest

# Check Attic version
docker run --rm ghcr.io/nix-containers/images/attic:latest attic --version

# Run Attic server
docker run -d -p 8080:8080 ghcr.io/nix-containers/images/attic:latest attic server
```

### Build Locally with Nix

```bash
# Build the image
nix build .#attic

# Load to Docker
nix run .#attic.copyTo -- docker-daemon:attic:latest

# Run tests
nix run .#attic-test
```

## What's Included

- Attic binary cache server
- S3 backend support
- Non-root user environment (UID 1000)

## Upstream

- **Attic**: https://github.com/zhaofengli/attic
# Cachix

A minimal container image with Cachix for binary cache management.

## Description

This image provides Cachix, a binary cache service for Nix packages, enabling efficient sharing and reuse of build results. Built on a non-root user setup (UID 1000) for enhanced security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/cachix:latest

# Run interactively
docker run -it ghcr.io/nix-containers/images/cachix:latest

# Use Cachix commands
docker run --rm ghcr.io/nix-containers/images/cachix:latest cachix --help
```

### Build Locally with Nix

```bash
# Build the image
nix build .#cachix

# Load to Docker
nix run .#cachix.copyTo -- docker-daemon:cachix:latest

# Run tests
nix run .#cachix-test
```

## What's Included

- Cachix binary cache client
- GNU Bash shell
- Core utilities (coreutils)
- Non-root user environment (UID 1000)
- Minimal base system

## Upstream

- **Cachix**: https://www.cachix.org/
- **Documentation**: https://docs.cachix.org/
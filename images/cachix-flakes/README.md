# Cachix Flakes

A minimal container image with Cachix optimized for Nix Flakes workflows.

## Description

This image provides Cachix for binary cache management with optimizations for Nix Flakes. Designed for CI/CD workflows and development environments using Nix Flakes. Built on a non-root user setup (UID 1000) for enhanced security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/cachix-flakes:latest

# Run interactively
docker run -it ghcr.io/nix-containers/images/cachix-flakes:latest

# Use Cachix with Flakes
docker run --rm -v $(pwd):/workspace ghcr.io/nix-containers/images/cachix-flakes:latest cachix push my-cache result
```

### Build Locally with Nix

```bash
# Build the image
nix build .#cachix-flakes

# Load to Docker
nix run .#cachix-flakes.copyTo -- docker-daemon:cachix-flakes:latest

# Run tests
nix run .#cachix-flakes-test
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
- **Nix Flakes**: https://nixos.wiki/wiki/Flakes
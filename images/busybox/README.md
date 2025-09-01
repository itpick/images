# BusyBox

A minimal container image with BusyBox utilities for embedded and constrained environments.

## Description

This image provides BusyBox, a single executable that provides many common Unix utilities in a minimal footprint. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for debugging containers, minimal base images, or environments where space is critical.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/busybox:latest

# Run BusyBox shell
docker run -it ghcr.io/nix-containers/images/busybox:latest sh

# List available commands
docker run --rm ghcr.io/nix-containers/images/busybox:latest busybox --list

# Use specific utilities
docker run --rm ghcr.io/nix-containers/images/busybox:latest wget --help
docker run --rm ghcr.io/nix-containers/images/busybox:latest ps aux
```

### Build Locally with Nix

```bash
# Build the image
nix build .#busybox

# Load to Docker
nix run .#busybox.copyTo -- docker-daemon:busybox:latest

# Run tests
nix run .#busybox-test
```

## What's Included

- BusyBox - single executable with many Unix utilities
- Common commands: ls, ps, wget, tar, gzip, vi, and many more
- Non-root user environment (UID 1000)
- Minimal footprint

## Upstream

- **BusyBox**: https://busybox.net/
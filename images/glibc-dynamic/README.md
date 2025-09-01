# Glibc Dynamic

A minimal container image with dynamically linked glibc binaries.

## Description

This image provides a minimal base with glibc and essential utilities, using dynamic linking for smaller binary sizes and shared library benefits. Built on a non-root user setup (UID 1000) for enhanced security. Perfect as a base image for applications that can rely on glibc being available.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/glibc-dynamic:latest

# Run interactive shell
docker run -it ghcr.io/nix-containers/images/glibc-dynamic:latest

# Use basic utilities
docker run --rm ghcr.io/nix-containers/images/glibc-dynamic:latest ls -la

# Check glibc version
docker run --rm ghcr.io/nix-containers/images/glibc-dynamic:latest ldd --version
```

### Build Locally with Nix

```bash
# Build the image
nix build .#glibc-dynamic

# Load to Docker
nix run .#glibc-dynamic.copyTo -- docker-daemon:glibc-dynamic:latest

# Run tests
nix run .#glibc-dynamic-test
```

## What's Included

- GNU C Library (glibc) - standard C library
- Dynamically linked bash shell
- Core utilities (ls, cp, mv, etc.)
- File utilities (find, which)
- Non-root user environment (UID 1000)
- Shared library support

## Upstream

- **GNU C Library**: https://www.gnu.org/software/libc/
- **GNU Coreutils**: https://www.gnu.org/software/coreutils/
- **Bash**: https://www.gnu.org/software/bash/
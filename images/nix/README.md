# Nix

A container image with the Nix package manager and build system.

## Description

This image provides the Nix package manager, allowing reproducible builds and declarative package management. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for CI/CD pipelines, development environments, or building reproducible software.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/nix:latest

# Run Nix shell
docker run -it ghcr.io/nix-containers/images/nix:latest

# Install and run a package
docker run --rm ghcr.io/nix-containers/images/nix:latest nix-shell -p hello --run hello

# Build a Nix expression
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/nix:latest nix-build
```

### Build Locally with Nix

```bash
# Build the image
nix build .#nix

# Load to Docker
nix run .#nix.copyTo -- docker-daemon:nix:latest

# Run tests
nix run .#nix-test
```

## What's Included

- Nix package manager - reproducible package management
- nix-shell, nix-build, and other Nix tools
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Minimal base system

## Upstream

- **Nix**: https://nixos.org/
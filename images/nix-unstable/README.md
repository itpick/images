# Nix Unstable

A container image with the latest unstable version of the Nix package manager.

## Description

This image provides the latest unstable version of the Nix package manager, giving access to the newest features, improvements, and experimental functionality before they reach stable releases. Ideal for testing new Nix features and staying on the cutting edge. Built with a non-root user setup (UID 1000) for enhanced security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/nix-unstable:latest

# Run interactively
docker run -it -v $(pwd):/workspace ghcr.io/nix-containers/images/nix-unstable:latest

# Use latest Nix features
docker run --rm -v $(pwd):/workspace ghcr.io/nix-containers/images/nix-unstable:latest nix --version
```

### Build Locally with Nix

```bash
# Build the image
nix build .#nix-unstable

# Load to Docker
nix run .#nix-unstable.copyTo -- docker-daemon:nix-unstable:latest

# Run tests
nix run .#nix-unstable-test
```

## What's Included

- Latest unstable Nix package manager
- GNU Bash shell
- Core utilities (coreutils)
- Non-root user environment (UID 1000)
- Access to experimental features

## Features

- **Latest Features**: Access to newest Nix functionality
- **Experimental Commands**: Try new Nix subcommands
- **Performance Improvements**: Latest optimizations
- **Bug Fixes**: Most recent bug fixes
- **Development Tools**: For Nix package development

## Use Cases

- Testing new Nix features before stable release
- Development of Nix packages and expressions
- CI/CD pipelines requiring latest functionality
- Research and experimentation with Nix
- Contributing to Nix ecosystem development

## Warning

This version may contain unstable features and breaking changes. Use with caution in production environments.

## Upstream

- **Nix**: https://nixos.org/
- **Development**: https://github.com/NixOS/nix
- **Manual**: https://nixos.org/manual/nix/unstable/
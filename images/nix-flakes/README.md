# Nix Flakes

A container image with Nix package manager featuring Flakes support for reproducible builds.

## Description

This image provides the Nix package manager with Flakes support enabled. Flakes are an experimental feature that improves reproducibility, composability, and usability of Nix expressions. Perfect for CI/CD pipelines and development environments requiring hermetic builds. Built with a non-root user setup (UID 1000) for enhanced security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/nix-flakes:latest

# Run interactively with flakes
docker run -it -v $(pwd):/workspace ghcr.io/nix-containers/images/nix-flakes:latest

# Build a flake
docker run --rm -v $(pwd):/workspace ghcr.io/nix-containers/images/nix-flakes:latest nix build
```

### Build Locally with Nix

```bash
# Build the image
nix build .#nix-flakes

# Load to Docker
nix run .#nix-flakes.copyTo -- docker-daemon:nix-flakes:latest

# Run tests
nix run .#nix-flakes-test
```

## What's Included

- Nix package manager with Flakes support
- GNU Bash shell
- Core utilities (coreutils)
- Non-root user environment (UID 1000)
- Pre-configured for Flakes workflows

## Features

- **Reproducible Builds**: Lock files ensure consistent builds
- **Composability**: Easy composition of multiple Nix expressions
- **Developer Shells**: `nix develop` for development environments
- **Templates**: `nix flake init` for project scaffolding
- **Registry**: Access to community flakes and templates

## Use Cases

- CI/CD pipelines with reproducible builds
- Development environment management
- Package building and distribution
- Infrastructure as Code with Nix
- Cross-platform software deployment

## Upstream

- **Nix**: https://nixos.org/
- **Flakes Documentation**: https://nixos.wiki/wiki/Flakes
- **Manual**: https://nixos.org/manual/nix/unstable/
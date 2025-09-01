# DevEnv

A container image with DevEnv for fast, declarative, and reproducible developer environments.

## Description

This image provides DevEnv, a tool for creating fast, declarative, and reproducible developer environments using Nix. DevEnv simplifies the setup of development environments with automatic dependency management and shell integration. Built on a non-root user setup (UID 1000) for enhanced security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/devenv:latest

# Run interactively
docker run -it -v $(pwd):/workspace ghcr.io/nix-containers/images/devenv:latest

# Initialize a new devenv
docker run --rm -v $(pwd):/workspace ghcr.io/nix-containers/images/devenv:latest devenv init
```

### Build Locally with Nix

```bash
# Build the image
nix build .#devenv

# Load to Docker
nix run .#devenv.copyTo -- docker-daemon:devenv:latest

# Run tests
nix run .#devenv-test
```

## What's Included

- DevEnv CLI tool
- GNU Bash shell
- Core utilities (coreutils)
- Non-root user environment (UID 1000)
- Minimal base system

## Use Cases

- Creating reproducible development environments
- Managing project dependencies
- Setting up consistent development workflows
- CI/CD environment preparation

## Upstream

- **DevEnv**: https://devenv.sh/
- **Documentation**: https://devenv.sh/getting-started/
- **GitHub**: https://github.com/cachix/devenv
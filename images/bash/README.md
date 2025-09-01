# Bash

A minimal container image with GNU Bash shell and core utilities.

## Description

This image provides a secure, minimal environment with GNU Bash and essential command-line utilities. Built on a non-root user setup (UID 1000) for enhanced security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/bash:latest

# Run interactively
docker run -it ghcr.io/nix-containers/images/bash:latest

# Run a command
docker run --rm ghcr.io/nix-containers/images/bash:latest echo "Hello World"
```

### Build Locally with Nix

```bash
# Build the image
nix build .#bash

# Load to Docker
nix run .#bash.copyTo -- docker-daemon:bash:latest

# Run tests
nix run .#bash-test
```

## What's Included

- GNU Bash shell
- Core utilities (coreutils)
- Non-root user environment (UID 1000)
- Minimal base system

## Upstream

- **Bash**: https://www.gnu.org/software/bash/
- **Coreutils**: https://www.gnu.org/software/coreutils/
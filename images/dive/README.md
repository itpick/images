# Dive

A tool for exploring Docker images and analyzing layer contents to optimize image size.

## Description

This image provides Dive, a powerful tool for exploring Docker images, examining layer contents, and discovering opportunities to reduce image size. Essential for Docker image optimization and understanding image composition. Built with a non-root user setup (UID 1000) for secure analysis workflows.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/dive:latest

# Analyze a Docker image
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/nix-containers/images/dive:latest image-name:tag

# Run interactively
docker run -it -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/nix-containers/images/dive:latest
```

### Build Locally with Nix

```bash
# Build the image
nix build .#dive

# Load to Docker
nix run .#dive.copyTo -- docker-daemon:dive:latest

# Run tests
nix run .#dive-test
```

## What's Included

- Dive image analysis tool
- GNU Bash shell
- Core utilities (coreutils, findutils)
- Non-root user environment (UID 1000)
- Minimal base system

## Use Cases

- Analyzing Docker image layers and contents
- Identifying unnecessary files in images
- Optimizing Docker image size
- Understanding image composition
- CI/CD image analysis workflows

## Upstream

- **Dive**: https://github.com/wagoodman/dive
- **Documentation**: https://github.com/wagoodman/dive#installation
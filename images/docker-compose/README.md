# Docker Compose

A container image with Docker Compose for defining and running multi-container Docker applications.

## Description

This image provides Docker Compose, a tool for defining and running multi-container Docker applications using YAML configuration files. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for CI/CD pipelines, development environments, or managing complex containerized applications.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/docker-compose:latest

# Check Docker Compose version
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/nix-containers/images/docker-compose:latest docker-compose --version

# Run docker-compose up
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/docker-compose:latest docker-compose up -d

# Run docker-compose down
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/docker-compose:latest docker-compose down
```

### Build Locally with Nix

```bash
# Build the image
nix build .#docker-compose

# Load to Docker
nix run .#docker-compose.copyTo -- docker-daemon:docker-compose:latest

# Run tests
nix run .#docker-compose-test
```

## What's Included

- Docker Compose - multi-container application orchestration
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- YAML configuration support

## Upstream

- **Docker Compose**: https://docs.docker.com/compose/
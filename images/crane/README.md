# Crane

Tool for interacting with remote container images and registries

## Description

Crane is a tool for interacting with remote container images and registries. This container image provides a complete Crane installation with enhanced security features including non-root execution and minimal attack surface. Crane can be used to copy, list, delete, and manipulate container images without requiring a container runtime. It's particularly useful for CI/CD pipelines, registry management, and container image workflows where you need lightweight operations on OCI images.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/crane:latest

# List tags for an image
docker run --rm ghcr.io/nix-containers/images/crane:latest \
  crane ls ubuntu

# Copy an image between registries
docker run --rm \
  -v ~/.docker/config.json:/home/nonroot/.docker/config.json:ro \
  ghcr.io/nix-containers/images/crane:latest \
  crane copy source-registry/image:tag target-registry/image:tag

# Get image manifest
docker run --rm ghcr.io/nix-containers/images/crane:latest \
  crane manifest ubuntu:latest
```

### Build Locally with Nix

```bash
# Build the image
nix build .#crane

# Load to Docker
nix run .#crane.copyTo -- docker-daemon:crane:latest

# Run tests
nix run .#crane-test
```

## What's Included

- Crane container registry client
- Image copy, list, delete, and manipulation tools
- OCI registry authentication support
- Essential system utilities (bash, coreutils, findutils, which)
- Non-root user execution for enhanced security

## Upstream

- https://github.com/google/go-containerregistry
- https://github.com/google/go-containerregistry/tree/main/cmd/crane
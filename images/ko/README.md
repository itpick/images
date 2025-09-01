# Ko

Build and deploy Go applications on Kubernetes

## Description

Ko is a tool for building and deploying Go applications to Kubernetes. This container image provides a complete Ko installation with Go runtime and Git version control. Ko builds Go applications into minimal container images without requiring Docker or a Dockerfile, and can deploy them directly to Kubernetes clusters. It supports advanced features like multi-stage builds, static linking, and automatic base image selection for security and performance.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/ko:latest

# Build and push a Go application
docker run --rm \
  -v /host/go-app:/home/nonroot/app \
  -v ~/.docker/config.json:/home/nonroot/.docker/config.json:ro \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/ko:latest \
  ko build ./cmd/app

# Deploy to Kubernetes
docker run --rm \
  -v /host/go-app:/home/nonroot/app \
  -v ~/.kube/config:/home/nonroot/.kube/config:ro \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/ko:latest \
  ko apply -f config/

# Publish with specific tag
docker run --rm \
  -v /host/go-app:/home/nonroot/app \
  -v ~/.docker/config.json:/home/nonroot/.docker/config.json:ro \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/ko:latest \
  ko build --tags=v1.0.0 ./cmd/app
```

### Build Locally with Nix

```bash
# Build the image
nix build .#ko

# Load to Docker
nix run .#ko.copyTo -- docker-daemon:ko:latest

# Run tests
nix run .#ko-test
```

## What's Included

- Ko container build and deployment tool
- Go programming language runtime
- Git version control system
- Essential development utilities (findutils, which)
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security
- GOPATH set to /home/nonroot/go

## Upstream

- https://ko.build/
- https://github.com/ko-build/ko
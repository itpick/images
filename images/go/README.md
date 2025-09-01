# Go

A container image with Go programming language and development tools.

## Description

This image provides a complete Go development environment with the latest Go compiler, build tools, and essential utilities. Optimized for both development and building Go applications with a non-root user setup (UID 1000).

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/go:latest

# Check Go version
docker run --rm ghcr.io/nix-containers/images/go:latest go version

# Build a Go program
docker run --rm -v $(pwd):/app -w /app ghcr.io/nix-containers/images/go:latest go build .

# Run Go mod commands
docker run --rm -v $(pwd):/app -w /app ghcr.io/nix-containers/images/go:latest go mod tidy
```

### Build Locally with Nix

```bash
# Build the image
nix build .#go

# Load to Docker
nix run .#go.copyTo -- docker-daemon:go:latest

# Run tests
nix run .#go-test
```

## What's Included

- Go compiler and runtime
- Git for module management
- GCC and build tools
- Core utilities and shell
- Non-root user environment (UID 1000)
- Pre-configured GOPATH and module cache

## Upstream

- **Go**: https://golang.org/
- **Go Documentation**: https://golang.org/doc/
# Curl

A minimal container image with curl, the versatile command-line tool for transferring data.

## Description

This image provides curl along with bash and core utilities for making HTTP requests and transferring data from or to servers. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for testing APIs, downloading files, or scripting data transfers.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/curl:latest

# Make a simple HTTP request
docker run --rm ghcr.io/nix-containers/images/curl:latest curl -s https://httpbin.org/get

# Download a file
docker run --rm -v $(pwd):/data ghcr.io/nix-containers/images/curl:latest curl -o /data/file.txt https://example.com/file.txt

# Test an API with JSON
docker run --rm ghcr.io/nix-containers/images/curl:latest curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' https://httpbin.org/post
```

### Build Locally with Nix

```bash
# Build the image
nix build .#curl

# Load to Docker
nix run .#curl.copyTo -- docker-daemon:curl:latest

# Run tests
nix run .#curl-test
```

## What's Included

- curl - command-line tool for transferring data with URLs
- Bash shell for scripting
- Core utilities (coreutils)
- Non-root user environment (UID 1000)
- Minimal base system

## Upstream

- **curl**: https://curl.se/
# Nginx

A container image with Nginx web server and reverse proxy.

## Description

This image provides Nginx, a high-performance HTTP server and reverse proxy. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for serving static content, load balancing, or as a reverse proxy for applications.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/nginx:latest

# Run Nginx with default configuration
docker run -d --name nginx -p 8080:8080 ghcr.io/nix-containers/images/nginx:latest nginx -g "daemon off;"

# Serve static content
docker run -d --name nginx \
  -p 8080:8080 \
  -v $(pwd)/html:/usr/share/nginx/html:ro \
  ghcr.io/nix-containers/images/nginx:latest nginx -g "daemon off;"

# Run with custom configuration
docker run -d --name nginx \
  -p 8080:8080 \
  -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
  ghcr.io/nix-containers/images/nginx:latest nginx -g "daemon off;"
```

### Build Locally with Nix

```bash
# Build the image
nix build .#nginx

# Load to Docker
nix run .#nginx.copyTo -- docker-daemon:nginx:latest

# Run tests
nix run .#nginx-test
```

## What's Included

- Nginx - high-performance web server and reverse proxy
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Minimal base system

## Upstream

- **Nginx**: https://nginx.org/
# Caddy

A powerful, enterprise-ready, open source web server with automatic HTTPS

## Description

Caddy is a powerful web server that makes your sites more secure, more reliable, and more scalable. It's the only web server to use HTTPS automatically and by default. This container image provides a complete Caddy installation with enhanced security features including non-root execution and minimal attack surface. Caddy automatically obtains and renews TLS certificates, supports HTTP/2 and HTTP/3, and includes advanced features like reverse proxying, load balancing, and dynamic configuration.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/caddy:latest

# Run with default configuration (serves files from /home/nonroot/www)
docker run -d --name caddy \
  -p 80:80 -p 443:443 \
  -v /host/www:/home/nonroot/www \
  ghcr.io/nix-containers/images/caddy:latest

# Run with custom Caddyfile
docker run -d --name caddy \
  -p 80:80 -p 443:443 \
  -v /host/Caddyfile:/home/nonroot/Caddyfile \
  ghcr.io/nix-containers/images/caddy:latest \
  caddy run --config /home/nonroot/Caddyfile

# Simple reverse proxy
docker run -d --name caddy \
  -p 80:80 -p 443:443 \
  ghcr.io/nix-containers/images/caddy:latest \
  caddy reverse-proxy --from example.com --to localhost:8080
```

### Build Locally with Nix

```bash
# Build the image
nix build .#caddy

# Load to Docker
nix run .#caddy.copyTo -- docker-daemon:caddy:latest

# Run tests
nix run .#caddy-test
```

## What's Included

- Caddy web server with automatic HTTPS
- Full HTTP/2 and HTTP/3 support
- Built-in reverse proxy and load balancer
- Automatic TLS certificate management
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security

## Upstream

- https://caddyserver.com/
- https://github.com/caddyserver/caddy
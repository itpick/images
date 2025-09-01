# HAProxy

A reliable, high performance TCP/HTTP load balancer

## Description

HAProxy is a free, very fast and reliable solution offering high availability, load balancing, and proxying for TCP and HTTP-based applications. This container image provides a complete HAProxy installation with enhanced security features including non-root execution and minimal attack surface. HAProxy is particularly suited for very high traffic web sites and is used by many of the world's most visited ones including GitHub, Bitbucket, Stack Overflow, Reddit, Tumblr, Twitter and others.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/haproxy:latest

# Run with custom configuration
docker run -d --name haproxy \
  -v /host/haproxy.cfg:/home/nonroot/haproxy.cfg \
  -p 80:80 -p 443:443 -p 8080:8080 \
  ghcr.io/nix-containers/images/haproxy:latest \
  haproxy -f /home/nonroot/haproxy.cfg

# Simple load balancer example
docker run -d --name haproxy \
  -p 80:80 \
  ghcr.io/nix-containers/images/haproxy:latest \
  haproxy -f - <<EOF
global
    daemon
defaults
    mode http
frontend web_frontend
    bind *:80
    default_backend web_servers
backend web_servers
    server web1 192.168.1.10:80 check
    server web2 192.168.1.11:80 check
EOF

# Check configuration syntax
docker run --rm \
  -v /host/haproxy.cfg:/home/nonroot/haproxy.cfg \
  ghcr.io/nix-containers/images/haproxy:latest \
  haproxy -c -f /home/nonroot/haproxy.cfg
```

### Build Locally with Nix

```bash
# Build the image
nix build .#haproxy

# Load to Docker
nix run .#haproxy.copyTo -- docker-daemon:haproxy:latest

# Run tests
nix run .#haproxy-test
```

## What's Included

- HAProxy load balancer and proxy server
- SSL/TLS termination support
- Advanced load balancing algorithms
- Health checking and monitoring
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security
- Standard ports 80, 443, and 8080 exposed

## Upstream

- https://www.haproxy.org/
- https://github.com/haproxy/haproxy
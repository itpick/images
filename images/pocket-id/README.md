# Pocket ID

A lightweight, self-hosted identity provider and authentication service.

## Description

This image provides Pocket ID, a lightweight and secure identity provider that can be self-hosted. It offers OAuth2 and OpenID Connect capabilities, making it suitable for providing authentication services to web applications and APIs. Built with a non-root user setup (UID 1000) for enhanced security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/pocket-id:latest

# Run with configuration
docker run --rm -p 8080:8080 -v $(pwd)/config:/config ghcr.io/nix-containers/images/pocket-id:latest

# Show help
docker run --rm ghcr.io/nix-containers/images/pocket-id:latest pocket-id --help
```

### Build Locally with Nix

```bash
# Build the image
nix build .#pocket-id

# Load to Docker
nix run .#pocket-id.copyTo -- docker-daemon:pocket-id:latest

# Run tests
nix run .#pocket-id-test
```

## What's Included

- Pocket ID authentication server
- GNU Bash shell
- Core utilities (coreutils)
- Non-root user environment (UID 1000)
- Minimal base system

## Features

- **OAuth2 Provider**: Full OAuth2 authorization server
- **OpenID Connect**: OIDC-compliant identity provider
- **Self-hosted**: Complete control over your identity infrastructure
- **Lightweight**: Minimal resource requirements
- **Secure**: Built with security best practices

## Use Cases

- Self-hosted authentication for web applications
- OAuth2 provider for microservices
- Identity management for internal tools
- Development and testing identity services
- Privacy-focused authentication solutions

## Configuration

Pocket ID requires configuration files for proper operation. Mount your configuration directory and refer to the upstream documentation for setup instructions.

## Upstream

- **Pocket ID**: https://github.com/pocket-id/pocket-id (if available)
- **Documentation**: Refer to package documentation in Nixpkgs
# Maddy

A composable, all-in-one mail server with SMTP, IMAP, and modern security features.

## Description

This image provides Maddy, a modern mail server that combines SMTP and IMAP functionality in a single binary. Designed for simplicity and security with built-in support for modern email standards, TLS, and anti-spam measures. Built with a non-root user setup (UID 1000) for enhanced security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/maddy:latest

# Run with configuration file
docker run --rm -v $(pwd)/maddy.conf:/etc/maddy/maddy.conf -p 25:25 -p 143:143 ghcr.io/nix-containers/images/maddy:latest

# Show help
docker run --rm ghcr.io/nix-containers/images/maddy:latest maddy --help
```

### Build Locally with Nix

```bash
# Build the image
nix build .#maddy

# Load to Docker
nix run .#maddy.copyTo -- docker-daemon:maddy:latest

# Run tests
nix run .#maddy-test
```

## What's Included

- Maddy mail server binary
- GNU Bash shell
- Core utilities (coreutils)
- Non-root user environment (UID 1000)
- Minimal base system

## Features

- **SMTP Server**: Full-featured SMTP server with relay support
- **IMAP Server**: IMAP4rev1 server for mail access
- **Security**: Built-in TLS, DKIM, SPF, and DMARC support
- **Anti-spam**: Integrated spam filtering capabilities
- **Storage**: Flexible storage backends
- **Configuration**: Simple, human-readable configuration

## Use Cases

- Self-hosted email server
- Corporate mail server deployment
- Development and testing email services
- Containerized mail server solutions

## Upstream

- **Maddy**: https://maddy.email/
- **Documentation**: https://maddy.email/docs/
- **GitHub**: https://github.com/foxcpp/maddy
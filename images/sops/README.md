# SOPS

A container image with SOPS (Secrets OPerationS) for managing encrypted secrets.

## Description

This image provides SOPS, a tool for managing secrets in development and operations workflows. Supports encryption with age, PGP, AWS KMS, GCP KMS, and Azure Key Vault. Built with a non-root user setup (UID 1000) for security.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/sops:latest

# Check SOPS version
docker run --rm ghcr.io/nix-containers/images/sops:latest sops --version

# Encrypt a file
docker run --rm -v $(pwd):/app -w /app ghcr.io/nix-containers/images/sops:latest sops --encrypt --age [age-key] secrets.yaml

# Decrypt a file
docker run --rm -v $(pwd):/app -w /app ghcr.io/nix-containers/images/sops:latest sops --decrypt secrets.enc.yaml
```

### Build Locally with Nix

```bash
# Build the image
nix build .#sops

# Load to Docker
nix run .#sops.copyTo -- docker-daemon:sops:latest

# Run tests
nix run .#sops-test
```

## What's Included

- SOPS encryption tool
- Age encryption support
- PGP encryption support
- Non-root user environment (UID 1000)

## Upstream

- **SOPS**: https://github.com/getsops/sops
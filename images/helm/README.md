# Helm

A container image with Helm, the package manager for Kubernetes.

## Description

This image provides Helm along with kubectl for managing Kubernetes applications. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for deploying, upgrading, and managing Kubernetes applications using Helm charts in CI/CD pipelines or development environments.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/helm:latest

# Check Helm version
docker run --rm ghcr.io/nix-containers/images/helm:latest helm version

# Add a Helm repository
docker run --rm -v ~/.kube:/home/nonroot/.kube ghcr.io/nix-containers/images/helm:latest helm repo add stable https://charts.helm.sh/stable

# Install a chart
docker run --rm -v ~/.kube:/home/nonroot/.kube ghcr.io/nix-containers/images/helm:latest helm install my-release stable/nginx

# List Helm releases
docker run --rm -v ~/.kube:/home/nonroot/.kube ghcr.io/nix-containers/images/helm:latest helm list
```

### Build Locally with Nix

```bash
# Build the image
nix build .#helm

# Load to Docker
nix run .#helm.copyTo -- docker-daemon:helm:latest

# Run tests
nix run .#helm-test
```

## What's Included

- Helm - Kubernetes package manager
- kubectl - Kubernetes command-line tool
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Pre-configured Helm directories

## Upstream

- **Helm**: https://helm.sh/
- **Kubernetes**: https://kubernetes.io/
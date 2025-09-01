# Kubernetes Helm

The package manager for Kubernetes

## Description

Helm is the package manager for Kubernetes, providing an easy way to find, share, and use software built for Kubernetes. This container image provides a complete Helm installation with enhanced security features including non-root execution and minimal attack surface. Helm helps you manage Kubernetes applications through Helm Charts, which define, install, and upgrade even the most complex Kubernetes applications. Charts are easy to create, version, share, and publish.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/kubernetes-helm:latest

# List helm repositories
docker run --rm \
  -v ~/.kube/config:/home/nonroot/.kube/config:ro \
  ghcr.io/nix-containers/images/kubernetes-helm:latest \
  helm repo list

# Search for charts
docker run --rm \
  -v ~/.kube/config:/home/nonroot/.kube/config:ro \
  ghcr.io/nix-containers/images/kubernetes-helm:latest \
  helm search repo nginx

# Install a chart
docker run --rm \
  -v ~/.kube/config:/home/nonroot/.kube/config:ro \
  ghcr.io/nix-containers/images/kubernetes-helm:latest \
  helm install my-release stable/nginx-ingress
```

### Build Locally with Nix

```bash
# Build the image
nix build .#kubernetes-helm

# Load to Docker
nix run .#kubernetes-helm.copyTo -- docker-daemon:kubernetes-helm:latest

# Run tests
nix run .#kubernetes-helm-test
```

## What's Included

- Helm package manager for Kubernetes
- Chart management and templating engine
- Release management capabilities
- Repository management tools
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security

## Upstream

- https://helm.sh/
- https://github.com/helm/helm
# Kubectl

Kubernetes command-line tool

## Description

Kubectl is the command-line tool for interacting with Kubernetes clusters. This container image provides a complete kubectl installation with enhanced security features including non-root execution and minimal attack surface. Kubectl allows you to run commands against Kubernetes clusters, deploy applications, inspect and manage cluster resources, and view logs. It's an essential tool for Kubernetes administrators and developers working with containerized applications.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/kubectl:latest

# View cluster information
docker run --rm \
  -v ~/.kube/config:/home/nonroot/.kube/config:ro \
  ghcr.io/nix-containers/images/kubectl:latest \
  cluster-info

# List pods in default namespace
docker run --rm \
  -v ~/.kube/config:/home/nonroot/.kube/config:ro \
  ghcr.io/nix-containers/images/kubectl:latest \
  get pods

# Apply Kubernetes manifests
docker run --rm \
  -v ~/.kube/config:/home/nonroot/.kube/config:ro \
  -v /host/manifests:/home/nonroot/manifests \
  ghcr.io/nix-containers/images/kubectl:latest \
  apply -f /home/nonroot/manifests/
```

### Build Locally with Nix

```bash
# Build the image
nix build .#kubectl

# Load to Docker
nix run .#kubectl.copyTo -- docker-daemon:kubectl:latest

# Run tests
nix run .#kubectl-test
```

## What's Included

- kubectl Kubernetes CLI tool
- Non-root user execution for enhanced security
- KUBECONFIG environment variable set to /home/nonroot/.kube/config
- UTF-8 locale support
- Essential system utilities

## Upstream

- https://kubernetes.io/
- https://github.com/kubernetes/kubectl
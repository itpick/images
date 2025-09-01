# Dragonfly Operator

A Kubernetes operator for managing Dragonfly database instances in Kubernetes clusters.

## Description

This image provides the Dragonfly Operator, a Kubernetes operator that automates the deployment and management of Dragonfly database instances. Dragonfly is a modern Redis-compatible in-memory data store designed for high performance and efficiency.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/dragonfly-operator:latest

# Run the operator (requires Kubernetes context)
docker run --rm ghcr.io/nix-containers/images/dragonfly-operator:latest --help
```

### Build Locally with Nix

```bash
# Build the image
nix build .#dragonfly-operator

# Load to Docker
nix run .#dragonfly-operator.copyTo -- docker-daemon:dragonfly-operator:latest

# Run tests
nix run .#dragonfly-operator-test
```

## What's Included

- Dragonfly Operator binary (v1.1.11)
- Statically compiled Go binary
- Minimal runtime environment
- Non-root execution

## Use Cases

- Managing Dragonfly database instances in Kubernetes
- Automating Dragonfly deployments and updates
- Kubernetes-native database operations
- High-performance Redis-compatible data store management

## Kubernetes Deployment

The operator is typically deployed in a Kubernetes cluster using YAML manifests or Helm charts. Refer to the upstream documentation for complete deployment instructions.

## Upstream

- **Dragonfly Operator**: https://github.com/dragonflydb/dragonfly-operator
- **Dragonfly Database**: https://www.dragonflydb.io/
- **Documentation**: https://github.com/dragonflydb/dragonfly-operator/blob/main/README.md
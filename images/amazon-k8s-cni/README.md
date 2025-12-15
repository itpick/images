# amazon-k8s-cni

Networking plugin repository for pod networking in Kubernetes using Elastic Network Interfaces on AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-k8s-cni

# Load into Docker
nix build .#load-amazon-k8s-cni-to-docker && ./result/bin/load-amazon-k8s-cni-to-docker
```

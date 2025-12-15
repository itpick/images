# amazon-k8s-cni-fips

Networking plugin repository for pod networking in Kubernetes using Elastic Network Interfaces on AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-k8s-cni-fips

# Load into Docker
nix build .#load-amazon-k8s-cni-fips-to-docker && ./result/bin/load-amazon-k8s-cni-fips-to-docker
```

# cluster-api-aws-controller

Kubernetes Cluster API Provider AWS provides consistent deployment and day 2 operations of "self-managed" and EKS Kubernetes clusters on AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-aws-controller

# Load into Docker
nix build .#load-cluster-api-aws-controller-to-docker && ./result/bin/load-cluster-api-aws-controller-to-docker
```

# cluster-api-aws-controller-fips

Kubernetes Cluster API Provider AWS provides consistent deployment and day 2 operations of "self-managed" and EKS Kubernetes clusters on AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-aws-controller-fips

# Load into Docker
nix build .#load-cluster-api-aws-controller-fips-to-docker && ./result/bin/load-cluster-api-aws-controller-fips-to-docker
```

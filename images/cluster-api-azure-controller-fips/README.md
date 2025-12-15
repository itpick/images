# cluster-api-azure-controller-fips

Kubernetes Cluster API provider for Microsoft Azure infrastructure management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-azure-controller-fips

# Load into Docker
nix build .#load-cluster-api-azure-controller-fips-to-docker && ./result/bin/load-cluster-api-azure-controller-fips-to-docker
```

# cluster-api-gcp-controller-fips

Kubernetes Cluster API provider for Google Cloud Platform infrastructure management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-gcp-controller-fips

# Load into Docker
nix build .#load-cluster-api-gcp-controller-fips-to-docker && ./result/bin/load-cluster-api-gcp-controller-fips-to-docker
```

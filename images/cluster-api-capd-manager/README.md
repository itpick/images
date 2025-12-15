# cluster-api-capd-manager

Cluster API Provider Docker (CAPD) is a reference implementation of an infrastructure provider for the Cluster API project using Docker, not designed for production use and intended for development environments only

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-capd-manager

# Load into Docker
nix build .#load-cluster-api-capd-manager-to-docker && ./result/bin/load-cluster-api-capd-manager-to-docker
```

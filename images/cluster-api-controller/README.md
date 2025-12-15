# cluster-api-controller

Home for Cluster API, a subproject of sig-cluster-lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-controller

# Load into Docker
nix build .#load-cluster-api-controller-to-docker && ./result/bin/load-cluster-api-controller-to-docker
```

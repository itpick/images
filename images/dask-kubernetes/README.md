# dask-kubernetes

Native Kubernetes integration for Dask

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dask-kubernetes

# Load into Docker
nix build .#load-dask-kubernetes-to-docker && ./result/bin/load-dask-kubernetes-to-docker
```

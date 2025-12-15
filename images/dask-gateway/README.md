# dask-gateway

A multi-tenant server for securely deploying and managing Dask clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dask-gateway

# Load into Docker
nix build .#load-dask-gateway-to-docker && ./result/bin/load-dask-gateway-to-docker
```

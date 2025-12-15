# dask-gateway-server

A multi-tenant server for securely deploying and managing Dask clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dask-gateway-server

# Load into Docker
nix build .#load-dask-gateway-server-to-docker && ./result/bin/load-dask-gateway-server-to-docker
```

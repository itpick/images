# minio-object-browser-nixchart

MinIO Console is a library that provides a management and browser UI overlay for the MinIO Server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#minio-object-browser-nixchart

# Load into Docker
nix build .#load-minio-object-browser-nixchart-to-docker && ./result/bin/load-minio-object-browser-nixchart-to-docker
```

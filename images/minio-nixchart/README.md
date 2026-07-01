# minio-nixchart

MinIO is a high-performance, S3 compatible object store. This iamguarded variant is specifically designed to work with the iamguarded Helm chart

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#minio-nixchart

# Load into Docker
nix build .#load-minio-nixchart-to-docker && ./result/bin/load-minio-nixchart-to-docker
```

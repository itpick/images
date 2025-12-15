# minio-iamguarded

MinIO is a high-performance, S3 compatible object store. This iamguarded variant is specifically designed to work with the iamguarded Helm chart

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#minio-iamguarded

# Load into Docker
nix build .#load-minio-iamguarded-to-docker && ./result/bin/load-minio-iamguarded-to-docker
```

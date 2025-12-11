# minio-operator

MinIO Operator - Operator for MinIO on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#minio-operator

# Load into Docker
nix build .#load-minio-operator-to-docker && ./result/bin/load-minio-operator-to-docker
```

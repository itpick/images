# minio-operator-sidecar

MinIO Operator - Operator for MinIO on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#minio-operator-sidecar

# Load into Docker
nix build .#load-minio-operator-sidecar-to-docker && ./result/bin/load-minio-operator-sidecar-to-docker
```

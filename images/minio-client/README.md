# minio-client

Minimal image with Minio

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#minio-client

# Load into Docker
nix build .#load-minio-client-to-docker && ./result/bin/load-minio-client-to-docker
```

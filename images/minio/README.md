# minio

Minimal image with Minio

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#minio

# Load into Docker
nix build .#load-minio-to-docker && ./result/bin/load-minio-to-docker
```

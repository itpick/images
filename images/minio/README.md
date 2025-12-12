# minio

Minimal image with Minio

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 173.36 MB |
| Uncompressed | ~433.40 MB |

## Usage

```bash
# Build the image
nix build .#minio

# Load into Docker
nix build .#load-minio-to-docker && ./result/bin/load-minio-to-docker
```

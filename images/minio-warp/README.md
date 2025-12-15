# minio-warp

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#minio-warp

# Load into Docker
nix build .#load-minio-warp-to-docker && ./result/bin/load-minio-warp-to-docker
```

# minio-object-browser

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#minio-object-browser

# Load into Docker
nix build .#load-minio-object-browser-to-docker && ./result/bin/load-minio-object-browser-to-docker
```

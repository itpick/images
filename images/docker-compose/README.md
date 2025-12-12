# docker-compose

minimal docker-compose image with docker-compose binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 133.83 MB |
| Uncompressed | ~334.57 MB |

## Usage

```bash
# Build the image
nix build .#docker-compose

# Load into Docker
nix build .#load-docker-compose-to-docker && ./result/bin/load-docker-compose-to-docker
```

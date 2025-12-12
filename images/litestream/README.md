# litestream

Container image for litestream, to replicate SQLite databases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 150.05 MB |
| Uncompressed | ~375.13 MB |

## Usage

```bash
# Build the image
nix build .#litestream

# Load into Docker
nix build .#load-litestream-to-docker && ./result/bin/load-litestream-to-docker
```

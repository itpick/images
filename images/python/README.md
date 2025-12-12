# python

Minimal Python image based on Wolfi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 694.83 MB |
| Uncompressed | ~1.69 GB |

## Usage

```bash
# Build the image
nix build .#python

# Load into Docker
nix build .#load-python-to-docker && ./result/bin/load-python-to-docker
```

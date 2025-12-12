# glibc-dynamic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 76.03 MB |
| Uncompressed | ~190.08 MB |

## Usage

```bash
# Build the image
nix build .#glibc-dynamic

# Load into Docker
nix build .#load-glibc-dynamic-to-docker && ./result/bin/load-glibc-dynamic-to-docker
```

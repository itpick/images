# mimir

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 503.80 MB |
| Uncompressed | ~1.22 GB |

## Usage

```bash
# Build the image
nix build .#mimir

# Load into Docker
nix build .#load-mimir-to-docker && ./result/bin/load-mimir-to-docker
```

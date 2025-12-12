# backstage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 491.92 MB |
| Uncompressed | ~1.20 GB |

## Usage

```bash
# Build the image
nix build .#backstage

# Load into Docker
nix build .#load-backstage-to-docker && ./result/bin/load-backstage-to-docker
```

# alloy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 8s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 996.40 MB |
| Uncompressed | ~2.43 GB |

## Usage

```bash
# Build the image
nix build .#alloy

# Load into Docker
nix build .#load-alloy-to-docker && ./result/bin/load-alloy-to-docker
```

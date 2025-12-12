# age

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 105.32 MB |
| Uncompressed | ~263.30 MB |

## Usage

```bash
# Build the image
nix build .#age

# Load into Docker
nix build .#load-age-to-docker && ./result/bin/load-age-to-docker
```

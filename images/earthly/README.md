# earthly

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 442.29 MB |
| Uncompressed | ~1.07 GB |

## Usage

```bash
# Build the image
nix build .#earthly

# Load into Docker
nix build .#load-earthly-to-docker && ./result/bin/load-earthly-to-docker
```

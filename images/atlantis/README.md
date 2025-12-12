# atlantis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 607.84 MB |
| Uncompressed | ~1.48 GB |

## Usage

```bash
# Build the image
nix build .#atlantis

# Load into Docker
nix build .#load-atlantis-to-docker && ./result/bin/load-atlantis-to-docker
```

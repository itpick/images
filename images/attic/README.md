# attic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 164.07 MB |
| Uncompressed | ~410.19 MB |

## Usage

```bash
# Build the image
nix build .#attic

# Load into Docker
nix build .#load-attic-to-docker && ./result/bin/load-attic-to-docker
```

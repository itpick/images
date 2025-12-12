# apko

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 154.09 MB |
| Uncompressed | ~385.22 MB |

## Usage

```bash
# Build the image
nix build .#apko

# Load into Docker
nix build .#load-apko-to-docker && ./result/bin/load-apko-to-docker
```

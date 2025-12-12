# geoipupdate

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 106.52 MB |
| Uncompressed | ~266.31 MB |

## Usage

```bash
# Build the image
nix build .#geoipupdate

# Load into Docker
nix build .#load-geoipupdate-to-docker && ./result/bin/load-geoipupdate-to-docker
```

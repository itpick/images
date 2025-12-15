# geoipupdate

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#geoipupdate

# Load into Docker
nix build .#load-geoipupdate-to-docker && ./result/bin/load-geoipupdate-to-docker
```

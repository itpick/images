# postgres-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 118.08 MB |
| Uncompressed | ~295.22 MB |

## Usage

```bash
# Build the image
nix build .#postgres-exporter

# Load into Docker
nix build .#load-postgres-exporter-to-docker && ./result/bin/load-postgres-exporter-to-docker
```

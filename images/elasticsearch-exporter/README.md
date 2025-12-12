# elasticsearch-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 125.72 MB |
| Uncompressed | ~314.30 MB |

## Usage

```bash
# Build the image
nix build .#elasticsearch-exporter

# Load into Docker
nix build .#load-elasticsearch-exporter-to-docker && ./result/bin/load-elasticsearch-exporter-to-docker
```

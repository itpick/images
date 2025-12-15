# elasticsearch-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#elasticsearch-exporter

# Load into Docker
nix build .#load-elasticsearch-exporter-to-docker && ./result/bin/load-elasticsearch-exporter-to-docker
```

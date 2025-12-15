# prometheus-mongodb-exporter

Minimalist Wolfi-based Prometheus MongoDB Exporter image for exporting various metrics about MongoDB

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-mongodb-exporter

# Load into Docker
nix build .#load-prometheus-mongodb-exporter-to-docker && ./result/bin/load-prometheus-mongodb-exporter-to-docker
```

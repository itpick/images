# prometheus-node-exporter

Minimalist Wolfi-based Prometheus Node Exporter image for exporting node metrics

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-node-exporter

# Load into Docker
nix build .#load-prometheus-node-exporter-to-docker && ./result/bin/load-prometheus-node-exporter-to-docker
```

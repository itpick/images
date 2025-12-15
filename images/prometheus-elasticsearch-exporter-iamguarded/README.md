# prometheus-elasticsearch-exporter-iamguarded

Minimalist Wolfi-based Prometheus Elasticsearch Exporter image for exporting various metrics about Elasticsearch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-elasticsearch-exporter-iamguarded

# Load into Docker
nix build .#load-prometheus-elasticsearch-exporter-iamguarded-to-docker && ./result/bin/load-prometheus-elasticsearch-exporter-iamguarded-to-docker
```

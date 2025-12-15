# prometheus-redis-exporter

Minimalist Wolfi-based Prometheus Redis Exporter image for exporting metrics to Redis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-redis-exporter

# Load into Docker
nix build .#load-prometheus-redis-exporter-to-docker && ./result/bin/load-prometheus-redis-exporter-to-docker
```

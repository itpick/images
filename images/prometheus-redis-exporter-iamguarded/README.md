# prometheus-redis-exporter-iamguarded

Prometheus Redis Exporter image for exporting metrics to Redis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-redis-exporter-iamguarded

# Load into Docker
nix build .#load-prometheus-redis-exporter-iamguarded-to-docker && ./result/bin/load-prometheus-redis-exporter-iamguarded-to-docker
```

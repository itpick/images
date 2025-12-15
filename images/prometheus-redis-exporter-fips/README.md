# prometheus-redis-exporter-fips

Minimalist Wolfi-based Prometheus Redis Exporter image for exporting metrics to Redis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-redis-exporter-fips

# Load into Docker
nix build .#load-prometheus-redis-exporter-fips-to-docker && ./result/bin/load-prometheus-redis-exporter-fips-to-docker
```

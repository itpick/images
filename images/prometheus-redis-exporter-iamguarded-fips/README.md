# prometheus-redis-exporter-iamguarded-fips

Prometheus Redis Exporter image for exporting metrics to Redis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-redis-exporter-iamguarded-fips

# Load into Docker
nix build .#load-prometheus-redis-exporter-iamguarded-fips-to-docker && ./result/bin/load-prometheus-redis-exporter-iamguarded-fips-to-docker
```

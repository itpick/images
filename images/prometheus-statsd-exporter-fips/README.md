# prometheus-statsd-exporter-fips

Minimalist Wolfi-based Prometheus StatsD Exporter image for exporting metrics to StatsD

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-statsd-exporter-fips

# Load into Docker
nix build .#load-prometheus-statsd-exporter-fips-to-docker && ./result/bin/load-prometheus-statsd-exporter-fips-to-docker
```

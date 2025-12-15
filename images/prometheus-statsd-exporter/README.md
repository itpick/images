# prometheus-statsd-exporter

Minimalist Wolfi-based Prometheus StatsD Exporter image for exporting metrics to StatsD

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-statsd-exporter

# Load into Docker
nix build .#load-prometheus-statsd-exporter-to-docker && ./result/bin/load-prometheus-statsd-exporter-to-docker
```

# prometheus-statsd-exporter-nixchart

statsd_exporter receives StatsD-style metrics and exports them as Prometheus metrics

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-statsd-exporter-nixchart

# Load into Docker
nix build .#load-prometheus-statsd-exporter-nixchart-to-docker && ./result/bin/load-prometheus-statsd-exporter-nixchart-to-docker
```

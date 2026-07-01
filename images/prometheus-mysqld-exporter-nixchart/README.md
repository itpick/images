# prometheus-mysqld-exporter-nixchart

Prometheus exporter for MySQL server metrics

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-mysqld-exporter-nixchart

# Load into Docker
nix build .#load-prometheus-mysqld-exporter-nixchart-to-docker && ./result/bin/load-prometheus-mysqld-exporter-nixchart-to-docker
```

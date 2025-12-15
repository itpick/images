# prometheus-postgres-exporter

A PostgreSQL metric exporter for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-postgres-exporter

# Load into Docker
nix build .#load-prometheus-postgres-exporter-to-docker && ./result/bin/load-prometheus-postgres-exporter-to-docker
```

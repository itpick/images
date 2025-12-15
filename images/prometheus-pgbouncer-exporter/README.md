# prometheus-pgbouncer-exporter

A Prometheus exporter that collects and exposes metrics from PgBouncer, a lightweight connection pooler for PostgreSQL

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-pgbouncer-exporter

# Load into Docker
nix build .#load-prometheus-pgbouncer-exporter-to-docker && ./result/bin/load-prometheus-pgbouncer-exporter-to-docker
```

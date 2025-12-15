# prometheus-pgbouncer-exporter-fips

A FIPS-compliant image for PgBouncer Exporter. A Prometheus exporter that collects and exposes metrics from PgBouncer, a lightweight connection pooler for PostgreSQL

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-pgbouncer-exporter-fips

# Load into Docker
nix build .#load-prometheus-pgbouncer-exporter-fips-to-docker && ./result/bin/load-prometheus-pgbouncer-exporter-fips-to-docker
```

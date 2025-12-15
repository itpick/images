# sql_exporter-fips

Database-agnostic SQL Exporter for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sql_exporter-fips

# Load into Docker
nix build .#load-sql_exporter-fips-to-docker && ./result/bin/load-sql_exporter-fips-to-docker
```

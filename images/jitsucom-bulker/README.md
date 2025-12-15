# jitsucom-bulker

Service for bulk-loading data to databases with automatic schema management (Redshift, Snowflake, BigQuery, ClickHouse, Postgres, MySQL)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jitsucom-bulker

# Load into Docker
nix build .#load-jitsucom-bulker-to-docker && ./result/bin/load-jitsucom-bulker-to-docker
```

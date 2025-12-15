# duckdb-fips

DuckDB is an analytical in-process SQL database management system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#duckdb-fips

# Load into Docker
nix build .#load-duckdb-fips-to-docker && ./result/bin/load-duckdb-fips-to-docker
```

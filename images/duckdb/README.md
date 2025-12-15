# duckdb

DuckDB is an analytical in-process SQL database management system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#duckdb

# Load into Docker
nix build .#load-duckdb-to-docker && ./result/bin/load-duckdb-to-docker
```

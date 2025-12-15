# timescaledb-compat

A time-series database for high-performance real-time analytics packaged as a Postgres extension

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#timescaledb-compat

# Load into Docker
nix build .#load-timescaledb-compat-to-docker && ./result/bin/load-timescaledb-compat-to-docker
```

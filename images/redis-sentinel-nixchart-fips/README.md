# redis-sentinel-nixchart-fips

Redis Redis is an in-memory data structure store, used as a database, cache, and message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-sentinel-nixchart-fips

# Load into Docker
nix build .#load-redis-sentinel-nixchart-fips-to-docker && ./result/bin/load-redis-sentinel-nixchart-fips-to-docker
```

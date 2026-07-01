# redis-cluster-nixchart

Redis Redis is an in-memory data structure store, used as a database, cache, and message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-cluster-nixchart

# Load into Docker
nix build .#load-redis-cluster-nixchart-to-docker && ./result/bin/load-redis-cluster-nixchart-to-docker
```

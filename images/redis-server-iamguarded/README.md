# redis-server-iamguarded

Redis Redis is an in-memory data structure store, used as a database, cache, and message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-server-iamguarded

# Load into Docker
nix build .#load-redis-server-iamguarded-to-docker && ./result/bin/load-redis-server-iamguarded-to-docker
```

# memcached-iamguarded-fips

Memcached is an in-memory key-value store for small chunks of arbitrary data (strings, objects) from results of database calls, API calls, or page rendering

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#memcached-iamguarded-fips

# Load into Docker
nix build .#load-memcached-iamguarded-fips-to-docker && ./result/bin/load-memcached-iamguarded-fips-to-docker
```

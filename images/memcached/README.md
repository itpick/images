# memcached

Memcached is an in-memory key-value store for small chunks of arbitrary data (strings, objects) from results of database calls, API calls, or page rendering

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 72.44 MB |
| Uncompressed | ~181.11 MB |

## Usage

```bash
# Build the image
nix build .#memcached

# Load into Docker
nix build .#load-memcached-to-docker && ./result/bin/load-memcached-to-docker
```

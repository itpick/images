# redis

Chainguard image for Redis, an in-memory database that persists on disk. Redis is a key-value store, supporting an array of different values, including Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, and Bitmaps

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#redis

# Load into Docker
nix build .#load-redis-to-docker && ./result/bin/load-redis-to-docker
```

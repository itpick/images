# dragonfly

Dragonfly is a modern drop-in replacement for Redis and Memcached, offering better performance, multithreading, and lower memory overhead

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dragonfly

# Load into Docker
nix build .#load-dragonfly-to-docker && ./result/bin/load-dragonfly-to-docker
```

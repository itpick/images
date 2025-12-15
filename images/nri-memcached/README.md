# nri-memcached

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-memcached

# Load into Docker
nix build .#load-nri-memcached-to-docker && ./result/bin/load-nri-memcached-to-docker
```

# memcached-exporter-iamguarded

A memcached exporter for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#memcached-exporter-iamguarded

# Load into Docker
nix build .#load-memcached-exporter-iamguarded-to-docker && ./result/bin/load-memcached-exporter-iamguarded-to-docker
```

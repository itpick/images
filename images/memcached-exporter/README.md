# memcached-exporter

A memcached exporter for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#memcached-exporter

# Load into Docker
nix build .#load-memcached-exporter-to-docker && ./result/bin/load-memcached-exporter-to-docker
```

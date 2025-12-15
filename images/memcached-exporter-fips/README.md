# memcached-exporter-fips

A memcached exporter for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#memcached-exporter-fips

# Load into Docker
nix build .#load-memcached-exporter-fips-to-docker && ./result/bin/load-memcached-exporter-fips-to-docker
```

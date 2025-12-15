# geoip-api

A JSON REST API for Maxmind GeoIP databases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#geoip-api

# Load into Docker
nix build .#load-geoip-api-to-docker && ./result/bin/load-geoip-api-to-docker
```

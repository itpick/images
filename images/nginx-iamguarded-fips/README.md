# nginx-iamguarded-fips

Minimal Wolfi-based nginx HTTP, reverse proxy, mail proxy, and a generic TCP/UDP proxy server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-iamguarded-fips

# Load into Docker
nix build .#load-nginx-iamguarded-fips-to-docker && ./result/bin/load-nginx-iamguarded-fips-to-docker
```

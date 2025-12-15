# nri-memcached-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-memcached-fips

# Load into Docker
nix build .#load-nri-memcached-fips-to-docker && ./result/bin/load-nri-memcached-fips-to-docker
```

# nri-redis-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-redis-fips

# Load into Docker
nix build .#load-nri-redis-fips-to-docker && ./result/bin/load-nri-redis-fips-to-docker
```

# redis-nixchart-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-nixchart-fips

# Load into Docker
nix build .#load-redis-nixchart-fips-to-docker && ./result/bin/load-redis-nixchart-fips-to-docker
```

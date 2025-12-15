# redis-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-iamguarded-fips

# Load into Docker
nix build .#load-redis-iamguarded-fips-to-docker && ./result/bin/load-redis-iamguarded-fips-to-docker
```

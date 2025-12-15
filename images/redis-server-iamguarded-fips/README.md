# redis-server-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-server-iamguarded-fips

# Load into Docker
nix build .#load-redis-server-iamguarded-fips-to-docker && ./result/bin/load-redis-server-iamguarded-fips-to-docker
```

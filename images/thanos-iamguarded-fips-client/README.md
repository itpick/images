# thanos-iamguarded-fips-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-iamguarded-fips-client

# Load into Docker
nix build .#load-thanos-iamguarded-fips-client-to-docker && ./result/bin/load-thanos-iamguarded-fips-client-to-docker
```

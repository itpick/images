# thanos-iamguarded-fips

Highly available Prometheus setup with long term storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-iamguarded-fips

# Load into Docker
nix build .#load-thanos-iamguarded-fips-to-docker && ./result/bin/load-thanos-iamguarded-fips-to-docker
```

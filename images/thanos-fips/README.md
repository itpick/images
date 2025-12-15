# thanos-fips

Minimal Thanos Image, a highly available Prometheus setup with long term storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-fips

# Load into Docker
nix build .#load-thanos-fips-to-docker && ./result/bin/load-thanos-fips-to-docker
```

# thanos-nixchart-fips

Highly available Prometheus setup with long term storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-nixchart-fips

# Load into Docker
nix build .#load-thanos-nixchart-fips-to-docker && ./result/bin/load-thanos-nixchart-fips-to-docker
```

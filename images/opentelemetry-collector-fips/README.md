# opentelemetry-collector-fips

Minimal FIPS image with opentelemetry-collector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentelemetry-collector-fips

# Load into Docker
nix build .#load-opentelemetry-collector-fips-to-docker && ./result/bin/load-opentelemetry-collector-fips-to-docker
```

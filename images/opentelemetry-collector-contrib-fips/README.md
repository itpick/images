# opentelemetry-collector-contrib-fips

Minimal image with opentelemetry-collector-contrib

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentelemetry-collector-contrib-fips

# Load into Docker
nix build .#load-opentelemetry-collector-contrib-fips-to-docker && ./result/bin/load-opentelemetry-collector-contrib-fips-to-docker
```

# envoy-nixchart-fips

Envoy Cloud-native high-performance edge/middle/service proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#envoy-nixchart-fips

# Load into Docker
nix build .#load-envoy-nixchart-fips-to-docker && ./result/bin/load-envoy-nixchart-fips-to-docker
```

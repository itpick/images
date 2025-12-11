# envoy

Envoy Cloud-native high-performance edge/middle/service proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 14m 47s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#envoy

# Load into Docker
nix build .#load-envoy-to-docker && ./result/bin/load-envoy-to-docker
```

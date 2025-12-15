# envoy

Envoy Cloud-native high-performance edge/middle/service proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#envoy

# Load into Docker
nix build .#load-envoy-to-docker && ./result/bin/load-envoy-to-docker
```

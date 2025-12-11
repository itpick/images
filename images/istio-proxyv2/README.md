# istio-proxyv2

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#istio-proxyv2

# Load into Docker
nix build .#load-istio-proxyv2-to-docker && ./result/bin/load-istio-proxyv2-to-docker
```

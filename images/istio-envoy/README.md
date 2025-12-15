# istio-envoy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#istio-envoy

# Load into Docker
nix build .#load-istio-envoy-to-docker && ./result/bin/load-istio-envoy-to-docker
```

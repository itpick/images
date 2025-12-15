# istio-envoy-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#istio-envoy-fips

# Load into Docker
nix build .#load-istio-envoy-fips-to-docker && ./result/bin/load-istio-envoy-fips-to-docker
```

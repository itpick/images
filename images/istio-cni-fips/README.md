# istio-cni-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#istio-cni-fips

# Load into Docker
nix build .#load-istio-cni-fips-to-docker && ./result/bin/load-istio-cni-fips-to-docker
```

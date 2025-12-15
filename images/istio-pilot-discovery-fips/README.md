# istio-pilot-discovery-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#istio-pilot-discovery-fips

# Load into Docker
nix build .#load-istio-pilot-discovery-fips-to-docker && ./result/bin/load-istio-pilot-discovery-fips-to-docker
```

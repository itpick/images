# istio-proxy-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#istio-proxy-fips

# Load into Docker
nix build .#load-istio-proxy-fips-to-docker && ./result/bin/load-istio-proxy-fips-to-docker
```

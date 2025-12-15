# envoy-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#envoy-fips

# Load into Docker
nix build .#load-envoy-fips-to-docker && ./result/bin/load-envoy-fips-to-docker
```

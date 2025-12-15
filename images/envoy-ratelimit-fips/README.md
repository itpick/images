# envoy-ratelimit-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#envoy-ratelimit-fips

# Load into Docker
nix build .#load-envoy-ratelimit-fips-to-docker && ./result/bin/load-envoy-ratelimit-fips-to-docker
```

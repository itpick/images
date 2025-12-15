# configurable-http-proxy-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#configurable-http-proxy-fips

# Load into Docker
nix build .#load-configurable-http-proxy-fips-to-docker && ./result/bin/load-configurable-http-proxy-fips-to-docker
```

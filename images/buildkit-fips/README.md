# buildkit-fips

Buildkit is a concurrent, cache-efficient, and Dockerfile-agnostic builder toolkit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#buildkit-fips

# Load into Docker
nix build .#load-buildkit-fips-to-docker && ./result/bin/load-buildkit-fips-to-docker
```

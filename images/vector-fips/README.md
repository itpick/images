# vector-fips

Minimal FIPS compliant image with Vector, an end-to-end data observability pipeline

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vector-fips

# Load into Docker
nix build .#load-vector-fips-to-docker && ./result/bin/load-vector-fips-to-docker
```

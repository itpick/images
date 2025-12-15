# az-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#az-fips

# Load into Docker
nix build .#load-az-fips-to-docker && ./result/bin/load-az-fips-to-docker
```

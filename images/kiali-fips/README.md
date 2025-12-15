# kiali-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kiali-fips

# Load into Docker
nix build .#load-kiali-fips-to-docker && ./result/bin/load-kiali-fips-to-docker
```

# flux-image-reflector-controller-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-image-reflector-controller-fips

# Load into Docker
nix build .#load-flux-image-reflector-controller-fips-to-docker && ./result/bin/load-flux-image-reflector-controller-fips-to-docker
```

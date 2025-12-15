# flux-helm-controller-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-helm-controller-fips

# Load into Docker
nix build .#load-flux-helm-controller-fips-to-docker && ./result/bin/load-flux-helm-controller-fips-to-docker
```

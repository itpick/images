# metallb-controller-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metallb-controller-fips

# Load into Docker
nix build .#load-metallb-controller-fips-to-docker && ./result/bin/load-metallb-controller-fips-to-docker
```

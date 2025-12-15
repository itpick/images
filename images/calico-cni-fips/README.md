# calico-cni-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-cni-fips

# Load into Docker
nix build .#load-calico-cni-fips-to-docker && ./result/bin/load-calico-cni-fips-to-docker
```

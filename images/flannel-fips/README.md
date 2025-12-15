# flannel-fips

A FIPS-compliant Flannel image for Kubernetes. FIPS-compliant Flannel is a network fabric for Kubernetes, providing a way to manage network configurations across a cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flannel-fips

# Load into Docker
nix build .#load-flannel-fips-to-docker && ./result/bin/load-flannel-fips-to-docker
```

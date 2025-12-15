# kapp-controller-fips

Continuous delivery and package management for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kapp-controller-fips

# Load into Docker
nix build .#load-kapp-controller-fips-to-docker && ./result/bin/load-kapp-controller-fips-to-docker
```

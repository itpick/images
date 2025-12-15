# kuberay-operator-fips

A toolkit to run Ray applications on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kuberay-operator-fips

# Load into Docker
nix build .#load-kuberay-operator-fips-to-docker && ./result/bin/load-kuberay-operator-fips-to-docker
```

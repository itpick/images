# kuberay-operator

A toolkit to run Ray applications on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kuberay-operator

# Load into Docker
nix build .#load-kuberay-operator-to-docker && ./result/bin/load-kuberay-operator-to-docker
```

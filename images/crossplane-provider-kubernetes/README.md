# crossplane-provider-kubernetes

This image contains the Crossplane Kubernetes provider, which allows you to manage Kubernetes resources using Crossplane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-kubernetes

# Load into Docker
nix build .#load-crossplane-provider-kubernetes-to-docker && ./result/bin/load-crossplane-provider-kubernetes-to-docker
```

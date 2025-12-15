# kiali-operator

A Kubernetes Operator that automates the deployment, scaling, and management of Kiali - an observability console for Istio service mesh

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#kiali-operator

# Load into Docker
nix build .#load-kiali-operator-to-docker && ./result/bin/load-kiali-operator-to-docker
```

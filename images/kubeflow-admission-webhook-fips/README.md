# kubeflow-admission-webhook-fips

Kubeflow is a Machine Learning Toolkit for Kubernetes with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-admission-webhook-fips

# Load into Docker
nix build .#load-kubeflow-admission-webhook-fips-to-docker && ./result/bin/load-kubeflow-admission-webhook-fips-to-docker
```

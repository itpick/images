# kubeflow-notebook-controller-fips

Kubeflow is a Machine Learning Toolkit for Kubernetes with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-notebook-controller-fips

# Load into Docker
nix build .#load-kubeflow-notebook-controller-fips-to-docker && ./result/bin/load-kubeflow-notebook-controller-fips-to-docker
```

# kubeflow-tensorboard-controller-fips

Kubeflow is a Machine Learning Toolkit for Kubernetes with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-tensorboard-controller-fips

# Load into Docker
nix build .#load-kubeflow-tensorboard-controller-fips-to-docker && ./result/bin/load-kubeflow-tensorboard-controller-fips-to-docker
```

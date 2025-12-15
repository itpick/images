# kubeflow-notebook-controller

Kubeflow is a Machine Learning Toolkit for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-notebook-controller

# Load into Docker
nix build .#load-kubeflow-notebook-controller-to-docker && ./result/bin/load-kubeflow-notebook-controller-to-docker
```

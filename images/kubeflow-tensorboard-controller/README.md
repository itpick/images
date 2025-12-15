# kubeflow-tensorboard-controller

Kubeflow is a Machine Learning Toolkit for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-tensorboard-controller

# Load into Docker
nix build .#load-kubeflow-tensorboard-controller-to-docker && ./result/bin/load-kubeflow-tensorboard-controller-to-docker
```

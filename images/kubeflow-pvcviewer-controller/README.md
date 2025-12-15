# kubeflow-pvcviewer-controller

Kubeflow is a Machine Learning Toolkit for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pvcviewer-controller

# Load into Docker
nix build .#load-kubeflow-pvcviewer-controller-to-docker && ./result/bin/load-kubeflow-pvcviewer-controller-to-docker
```

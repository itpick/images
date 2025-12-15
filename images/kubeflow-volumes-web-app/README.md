# kubeflow-volumes-web-app

Kubeflow is a Machine Learning Toolkit for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-volumes-web-app

# Load into Docker
nix build .#load-kubeflow-volumes-web-app-to-docker && ./result/bin/load-kubeflow-volumes-web-app-to-docker
```

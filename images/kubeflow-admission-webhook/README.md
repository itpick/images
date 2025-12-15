# kubeflow-admission-webhook

Kubeflow is a Machine Learning Toolkit for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-admission-webhook

# Load into Docker
nix build .#load-kubeflow-admission-webhook-to-docker && ./result/bin/load-kubeflow-admission-webhook-to-docker
```

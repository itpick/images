# kubeflow-pipelines-viewer-crd-controller

Minimalist Kubeflow Pipelines Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-viewer-crd-controller

# Load into Docker
nix build .#load-kubeflow-pipelines-viewer-crd-controller-to-docker && ./result/bin/load-kubeflow-pipelines-viewer-crd-controller-to-docker
```

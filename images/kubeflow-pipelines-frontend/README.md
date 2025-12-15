# kubeflow-pipelines-frontend

Minimalist Kubeflow Pipelines Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-frontend

# Load into Docker
nix build .#load-kubeflow-pipelines-frontend-to-docker && ./result/bin/load-kubeflow-pipelines-frontend-to-docker
```

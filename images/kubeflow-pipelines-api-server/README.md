# kubeflow-pipelines-api-server

Minimalist Kubeflow Pipelines Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-api-server

# Load into Docker
nix build .#load-kubeflow-pipelines-api-server-to-docker && ./result/bin/load-kubeflow-pipelines-api-server-to-docker
```

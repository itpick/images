# kubeflow-pipelines-visualization-server

Minimal image with ml-pipeline/visualization-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-visualization-server

# Load into Docker
nix build .#load-kubeflow-pipelines-visualization-server-to-docker && ./result/bin/load-kubeflow-pipelines-visualization-server-to-docker
```

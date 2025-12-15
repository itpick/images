# kubeflow-pipelines-scheduledworkflow

Minimalist Kubeflow Pipelines Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-scheduledworkflow

# Load into Docker
nix build .#load-kubeflow-pipelines-scheduledworkflow-to-docker && ./result/bin/load-kubeflow-pipelines-scheduledworkflow-to-docker
```

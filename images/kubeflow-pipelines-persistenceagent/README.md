# kubeflow-pipelines-persistenceagent

Minimalist Kubeflow Pipelines Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-persistenceagent

# Load into Docker
nix build .#load-kubeflow-pipelines-persistenceagent-to-docker && ./result/bin/load-kubeflow-pipelines-persistenceagent-to-docker
```

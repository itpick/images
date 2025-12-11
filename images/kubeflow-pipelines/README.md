# kubeflow-pipelines

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 8s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines

# Load into Docker
nix build .#load-kubeflow-pipelines-to-docker && ./result/bin/load-kubeflow-pipelines-to-docker
```

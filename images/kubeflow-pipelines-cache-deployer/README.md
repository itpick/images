# kubeflow-pipelines-cache-deployer

Minimalist Kubeflow Pipelines Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-cache-deployer

# Load into Docker
nix build .#load-kubeflow-pipelines-cache-deployer-to-docker && ./result/bin/load-kubeflow-pipelines-cache-deployer-to-docker
```

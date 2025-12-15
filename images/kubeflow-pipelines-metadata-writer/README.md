# kubeflow-pipelines-metadata-writer

Minimalist Kubeflow Pipelines Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-metadata-writer

# Load into Docker
nix build .#load-kubeflow-pipelines-metadata-writer-to-docker && ./result/bin/load-kubeflow-pipelines-metadata-writer-to-docker
```

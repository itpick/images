# kubeflow-pipelines-apiserver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-apiserver

# Load into Docker
nix build .#load-kubeflow-pipelines-apiserver-to-docker && ./result/bin/load-kubeflow-pipelines-apiserver-to-docker
```

# kubeflow-pipelines-metadata-envoy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-metadata-envoy

# Load into Docker
nix build .#load-kubeflow-pipelines-metadata-envoy-to-docker && ./result/bin/load-kubeflow-pipelines-metadata-envoy-to-docker
```

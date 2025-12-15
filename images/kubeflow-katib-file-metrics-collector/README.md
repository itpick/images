# kubeflow-katib-file-metrics-collector

Minimalist Kubeflow Katib Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-katib-file-metrics-collector

# Load into Docker
nix build .#load-kubeflow-katib-file-metrics-collector-to-docker && ./result/bin/load-kubeflow-katib-file-metrics-collector-to-docker
```

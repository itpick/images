# kubeflow-katib-controller

Minimalist Kubeflow Katib Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-katib-controller

# Load into Docker
nix build .#load-kubeflow-katib-controller-to-docker && ./result/bin/load-kubeflow-katib-controller-to-docker
```

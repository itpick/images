# kubeflow-katib

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-katib

# Load into Docker
nix build .#load-kubeflow-katib-to-docker && ./result/bin/load-kubeflow-katib-to-docker
```

# kubeflow-katib-db-manager

Minimalist Kubeflow Katib Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-katib-db-manager

# Load into Docker
nix build .#load-kubeflow-katib-db-manager-to-docker && ./result/bin/load-kubeflow-katib-db-manager-to-docker
```

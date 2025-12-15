# kubeflow-centraldashboard

This project serves as the landing page and central dashboard for Kubeflow deployments. It provides a jump-off point to all other facets of the platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-centraldashboard

# Load into Docker
nix build .#load-kubeflow-centraldashboard-to-docker && ./result/bin/load-kubeflow-centraldashboard-to-docker
```

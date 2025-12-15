# kubeflow-jupyter-web-app-fips

Kubeflow is a Machine Learning Toolkit for Kubernetes with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-jupyter-web-app-fips

# Load into Docker
nix build .#load-kubeflow-jupyter-web-app-fips-to-docker && ./result/bin/load-kubeflow-jupyter-web-app-fips-to-docker
```

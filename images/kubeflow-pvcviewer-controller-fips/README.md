# kubeflow-pvcviewer-controller-fips

Kubeflow is a Machine Learning Toolkit for Kubernetes with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pvcviewer-controller-fips

# Load into Docker
nix build .#load-kubeflow-pvcviewer-controller-fips-to-docker && ./result/bin/load-kubeflow-pvcviewer-controller-fips-to-docker
```

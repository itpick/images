# kubeflow-profile-controller-fips

Kubeflow is a Machine Learning Toolkit for Kubernetes with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-profile-controller-fips

# Load into Docker
nix build .#load-kubeflow-profile-controller-fips-to-docker && ./result/bin/load-kubeflow-profile-controller-fips-to-docker
```

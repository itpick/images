# kubeflow-access-management-fips

Kubeflow is a Machine Learning Toolkit for Kubernetes with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-access-management-fips

# Load into Docker
nix build .#load-kubeflow-access-management-fips-to-docker && ./result/bin/load-kubeflow-access-management-fips-to-docker
```

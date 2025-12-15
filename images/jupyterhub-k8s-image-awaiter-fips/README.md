# jupyterhub-k8s-image-awaiter-fips

JupyterHub Kubernetes Image Awaiter - ensures images are pre-pulled before deployment

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jupyterhub-k8s-image-awaiter-fips

# Load into Docker
nix build .#load-jupyterhub-k8s-image-awaiter-fips-to-docker && ./result/bin/load-jupyterhub-k8s-image-awaiter-fips-to-docker
```

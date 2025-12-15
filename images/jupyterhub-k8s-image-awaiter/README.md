# jupyterhub-k8s-image-awaiter

JupyterHub Kubernetes Image Awaiter - ensures images are pre-pulled before deployment

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jupyterhub-k8s-image-awaiter

# Load into Docker
nix build .#load-jupyterhub-k8s-image-awaiter-to-docker && ./result/bin/load-jupyterhub-k8s-image-awaiter-to-docker
```

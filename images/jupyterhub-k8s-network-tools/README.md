# jupyterhub-k8s-network-tools

Network diagnostic tools for use within a JupyterHub Kubernetes cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jupyterhub-k8s-network-tools

# Load into Docker
nix build .#load-jupyterhub-k8s-network-tools-to-docker && ./result/bin/load-jupyterhub-k8s-network-tools-to-docker
```

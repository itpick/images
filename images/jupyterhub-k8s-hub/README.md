# jupyterhub-k8s-hub

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jupyterhub-k8s-hub

# Load into Docker
nix build .#load-jupyterhub-k8s-hub-to-docker && ./result/bin/load-jupyterhub-k8s-hub-to-docker
```

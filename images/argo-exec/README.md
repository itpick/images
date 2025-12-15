# argo-exec

Argo is a collection of tools for Kubernetes that help users to run workflows and manage clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-exec

# Load into Docker
nix build .#load-argo-exec-to-docker && ./result/bin/load-argo-exec-to-docker
```

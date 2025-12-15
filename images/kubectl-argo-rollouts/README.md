# kubectl-argo-rollouts

Argo Rollouts is a Kubernetes controller and set of CRDs which provide advanced deployment capabilities such as blue-green, canary, canary analysis, experimentation, and progressive delivery features to Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-argo-rollouts

# Load into Docker
nix build .#load-kubectl-argo-rollouts-to-docker && ./result/bin/load-kubectl-argo-rollouts-to-docker
```

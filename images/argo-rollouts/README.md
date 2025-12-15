# argo-rollouts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#argo-rollouts

# Load into Docker
nix build .#load-argo-rollouts-to-docker && ./result/bin/load-argo-rollouts-to-docker
```

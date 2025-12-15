# argo-workflow-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-workflow-controller

# Load into Docker
nix build .#load-argo-workflow-controller-to-docker && ./result/bin/load-argo-workflow-controller-to-docker
```

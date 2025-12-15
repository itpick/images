# argo-workflow-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-workflow-cli

# Load into Docker
nix build .#load-argo-workflow-cli-to-docker && ./result/bin/load-argo-workflow-cli-to-docker
```

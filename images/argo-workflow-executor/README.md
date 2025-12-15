# argo-workflow-executor

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-workflow-executor

# Load into Docker
nix build .#load-argo-workflow-executor-to-docker && ./result/bin/load-argo-workflow-executor-to-docker
```

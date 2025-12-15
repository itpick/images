# argo-workflow-executor-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-workflow-executor-fips

# Load into Docker
nix build .#load-argo-workflow-executor-fips-to-docker && ./result/bin/load-argo-workflow-executor-fips-to-docker
```

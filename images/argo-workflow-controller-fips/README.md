# argo-workflow-controller-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-workflow-controller-fips

# Load into Docker
nix build .#load-argo-workflow-controller-fips-to-docker && ./result/bin/load-argo-workflow-controller-fips-to-docker
```

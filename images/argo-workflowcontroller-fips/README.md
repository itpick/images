# argo-workflowcontroller-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-workflowcontroller-fips

# Load into Docker
nix build .#load-argo-workflowcontroller-fips-to-docker && ./result/bin/load-argo-workflowcontroller-fips-to-docker
```

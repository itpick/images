# argo-cli-fips

Argo is a collection of tools for Kubernetes that help users to run workflows and manage clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-cli-fips

# Load into Docker
nix build .#load-argo-cli-fips-to-docker && ./result/bin/load-argo-cli-fips-to-docker
```

# flux-kustomize-controller

flux cli to interact with the Flux gitops toolkit components in a running cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-kustomize-controller

# Load into Docker
nix build .#load-flux-kustomize-controller-to-docker && ./result/bin/load-flux-kustomize-controller-to-docker
```

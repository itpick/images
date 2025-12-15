# flux-helm-controller

flux cli to interact with the Flux gitops toolkit components in a running cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-helm-controller

# Load into Docker
nix build .#load-flux-helm-controller-to-docker && ./result/bin/load-flux-helm-controller-to-docker
```

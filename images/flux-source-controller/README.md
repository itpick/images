# flux-source-controller

flux cli to interact with the Flux gitops toolkit components in a running cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-source-controller

# Load into Docker
nix build .#load-flux-source-controller-to-docker && ./result/bin/load-flux-source-controller-to-docker
```

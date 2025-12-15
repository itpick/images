# flux-notification-controller

flux cli to interact with the Flux gitops toolkit components in a running cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-notification-controller

# Load into Docker
nix build .#load-flux-notification-controller-to-docker && ./result/bin/load-flux-notification-controller-to-docker
```

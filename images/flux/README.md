# flux

flux cli to interact with the Flux gitops toolkit components in a running cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#flux

# Load into Docker
nix build .#load-flux-to-docker && ./result/bin/load-flux-to-docker
```

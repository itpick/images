# flux-operator

Flux Operator is a Kubernetes controller for managing the lifecycle of Flux CD

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#flux-operator

# Load into Docker
nix build .#load-flux-operator-to-docker && ./result/bin/load-flux-operator-to-docker
```

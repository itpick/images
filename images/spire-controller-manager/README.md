# spire-controller-manager

The SPIRE Controller Manager provides automated workload identity management for Kubernetes clusters through SPIRE

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spire-controller-manager

# Load into Docker
nix build .#load-spire-controller-manager-to-docker && ./result/bin/load-spire-controller-manager-to-docker
```

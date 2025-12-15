# rancher-system-upgrade-controller

A general-purpose, Kubernetes-native upgrade controller for nodes that provides automated upgrade capabilities for Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-system-upgrade-controller

# Load into Docker
nix build .#load-rancher-system-upgrade-controller-to-docker && ./result/bin/load-rancher-system-upgrade-controller-to-docker
```

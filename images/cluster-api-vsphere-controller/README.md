# cluster-api-vsphere-controller

Kubernetes-native declarative infrastructure for vSphere

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-vsphere-controller

# Load into Docker
nix build .#load-cluster-api-vsphere-controller-to-docker && ./result/bin/load-cluster-api-vsphere-controller-to-docker
```

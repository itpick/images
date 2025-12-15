# kubernetes-autoscaler-addon-resizer

Addon-resizer is a container that vertically scales a Deployment based on the number of nodes in your cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-autoscaler-addon-resizer

# Load into Docker
nix build .#load-kubernetes-autoscaler-addon-resizer-to-docker && ./result/bin/load-kubernetes-autoscaler-addon-resizer-to-docker
```

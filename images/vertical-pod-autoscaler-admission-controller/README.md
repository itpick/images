# vertical-pod-autoscaler-admission-controller

Image to automatically adjust the amount of CPU and memory requested by pods running in the Kubernetes Cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vertical-pod-autoscaler-admission-controller

# Load into Docker
nix build .#load-vertical-pod-autoscaler-admission-controller-to-docker && ./result/bin/load-vertical-pod-autoscaler-admission-controller-to-docker
```

# cluster-autoscaler

Minimal Kubernetes Cluster Autoscaler Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-autoscaler

# Load into Docker
nix build .#load-cluster-autoscaler-to-docker && ./result/bin/load-cluster-autoscaler-to-docker
```

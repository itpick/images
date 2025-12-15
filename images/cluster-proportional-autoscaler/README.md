# cluster-proportional-autoscaler

Minimal Kubernetes Cluster Proportional Autoscaler Container

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-proportional-autoscaler

# Load into Docker
nix build .#load-cluster-proportional-autoscaler-to-docker && ./result/bin/load-cluster-proportional-autoscaler-to-docker
```

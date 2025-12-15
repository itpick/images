# kube-state-metrics-iamguarded

Kube-state-metrics generates Prometheus metrics about Kubernetes objects

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-state-metrics-iamguarded

# Load into Docker
nix build .#load-kube-state-metrics-iamguarded-to-docker && ./result/bin/load-kube-state-metrics-iamguarded-to-docker
```

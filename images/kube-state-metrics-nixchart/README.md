# kube-state-metrics-nixchart

Kube-state-metrics generates Prometheus metrics about Kubernetes objects

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-state-metrics-nixchart

# Load into Docker
nix build .#load-kube-state-metrics-nixchart-to-docker && ./result/bin/load-kube-state-metrics-nixchart-to-docker
```

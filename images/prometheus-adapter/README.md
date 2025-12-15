# prometheus-adapter

prometheus-adapter is a Prometheus project used to collect Prometheus metrics in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-adapter

# Load into Docker
nix build .#load-prometheus-adapter-to-docker && ./result/bin/load-prometheus-adapter-to-docker
```

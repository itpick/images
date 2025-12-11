# prometheus-operator

Minimalist Wolfi-based image for Prometheus Operator. Prometheus Operator creates/configures/manages Prometheus clusters atop Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#prometheus-operator

# Load into Docker
nix build .#load-prometheus-operator-to-docker && ./result/bin/load-prometheus-operator-to-docker
```

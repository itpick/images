# prometheus-operator-nixchart

Prometheus Operator creates/configures/manages Prometheus clusters atop Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-operator-nixchart

# Load into Docker
nix build .#load-prometheus-operator-nixchart-to-docker && ./result/bin/load-prometheus-operator-nixchart-to-docker
```

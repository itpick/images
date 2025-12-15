# prometheus-config-reloader

Minimalist image for Prometheus Config Reloader. It helps with config of Prometheus Operator which creates/configures/manages Prometheus clusters atop Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-config-reloader

# Load into Docker
nix build .#load-prometheus-config-reloader-to-docker && ./result/bin/load-prometheus-config-reloader-to-docker
```

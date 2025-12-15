# kepler

Kepler (Kubernetes-based Efficient Power Level Exporter) is a Prometheus exporter that measures energy consumption metrics at the container, pod, and node levels in Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kepler

# Load into Docker
nix build .#load-kepler-to-docker && ./result/bin/load-kepler-to-docker
```

# neuvector-prometheus-exporter

A Wolfi-based image for NeuVector - a full lifecycle container security platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#neuvector-prometheus-exporter

# Load into Docker
nix build .#load-neuvector-prometheus-exporter-to-docker && ./result/bin/load-neuvector-prometheus-exporter-to-docker
```

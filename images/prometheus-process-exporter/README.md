# prometheus-process-exporter

process-exporter is an agent that collects process-specific metrics from a system and exposes them in a format that can be ingested by Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-process-exporter

# Load into Docker
nix build .#load-prometheus-process-exporter-to-docker && ./result/bin/load-prometheus-process-exporter-to-docker
```

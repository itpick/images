# prometheus-alertmanager

Minimalist Wolfi-based image for Prometheus Alertmanager. Handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing to the correct receiver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-alertmanager

# Load into Docker
nix build .#load-prometheus-alertmanager-to-docker && ./result/bin/load-prometheus-alertmanager-to-docker
```

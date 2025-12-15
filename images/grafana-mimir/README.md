# grafana-mimir

A minimal Wolfi-based image for Grafana Mimir, providing horizontally scalable, highly available, multi-tenant, long-term storage for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-mimir

# Load into Docker
nix build .#load-grafana-mimir-to-docker && ./result/bin/load-grafana-mimir-to-docker
```

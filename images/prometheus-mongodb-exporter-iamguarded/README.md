# prometheus-mongodb-exporter-iamguarded

Prometheus MongoDB Exporter image for exporting various metrics about MongoDB compatible with Iamguarded Helm chart

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-mongodb-exporter-iamguarded

# Load into Docker
nix build .#load-prometheus-mongodb-exporter-iamguarded-to-docker && ./result/bin/load-prometheus-mongodb-exporter-iamguarded-to-docker
```

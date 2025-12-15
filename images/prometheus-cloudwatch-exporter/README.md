# prometheus-cloudwatch-exporter

Minimalist Wolfi-based Prometheus CloudWatch Exporter image for exporting metrics to Amazon AWS CloudWatch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-cloudwatch-exporter

# Load into Docker
nix build .#load-prometheus-cloudwatch-exporter-to-docker && ./result/bin/load-prometheus-cloudwatch-exporter-to-docker
```

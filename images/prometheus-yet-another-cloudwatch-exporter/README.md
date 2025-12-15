# prometheus-yet-another-cloudwatch-exporter

Prometheus exporter for AWS CloudWatch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-yet-another-cloudwatch-exporter

# Load into Docker
nix build .#load-prometheus-yet-another-cloudwatch-exporter-to-docker && ./result/bin/load-prometheus-yet-another-cloudwatch-exporter-to-docker
```

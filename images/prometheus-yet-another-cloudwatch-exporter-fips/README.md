# prometheus-yet-another-cloudwatch-exporter-fips

A FIPS-compliant Prometheus exporter for AWS CloudWatch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-yet-another-cloudwatch-exporter-fips

# Load into Docker
nix build .#load-prometheus-yet-another-cloudwatch-exporter-fips-to-docker && ./result/bin/load-prometheus-yet-another-cloudwatch-exporter-fips-to-docker
```

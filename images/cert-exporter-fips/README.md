# cert-exporter-fips

A minimal FIPS image for cert-exporter: an application that exports certificate expiration metrics from disk, Kubernetes, and AWS Secrets Manager to Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-exporter-fips

# Load into Docker
nix build .#load-cert-exporter-fips-to-docker && ./result/bin/load-cert-exporter-fips-to-docker
```

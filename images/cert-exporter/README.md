# cert-exporter

A minimal, wolfi-based image for cert-exporter: an application that exports certificate expiration metrics from disk, Kubernetes, and AWS Secrets Manager to Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-exporter

# Load into Docker
nix build .#load-cert-exporter-to-docker && ./result/bin/load-cert-exporter-to-docker
```

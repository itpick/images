# x509-certificate-exporter

A Prometheus exporter to monitor x509 certificates expiration in Kubernetes clusters or standalone

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#x509-certificate-exporter

# Load into Docker
nix build .#load-x509-certificate-exporter-to-docker && ./result/bin/load-x509-certificate-exporter-to-docker
```

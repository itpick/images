# x509-certificate-exporter-fips

A Prometheus exporter to monitor x509 certificates expiration in Kubernetes clusters or standalone

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#x509-certificate-exporter-fips

# Load into Docker
nix build .#load-x509-certificate-exporter-fips-to-docker && ./result/bin/load-x509-certificate-exporter-fips-to-docker
```

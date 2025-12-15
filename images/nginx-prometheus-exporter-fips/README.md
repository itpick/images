# nginx-prometheus-exporter-fips

The nginx-prometheus-exporter-fips image is designed to scrape metrics from an NGINX instance and expose them to Prometheus in a secure and minimal environment. Below are detailed instructions for using the image in both Docker and Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-prometheus-exporter-fips

# Load into Docker
nix build .#load-nginx-prometheus-exporter-fips-to-docker && ./result/bin/load-nginx-prometheus-exporter-fips-to-docker
```

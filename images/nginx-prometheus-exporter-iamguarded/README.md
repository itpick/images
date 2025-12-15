# nginx-prometheus-exporter-iamguarded

Nginx prometheus exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-prometheus-exporter-iamguarded

# Load into Docker
nix build .#load-nginx-prometheus-exporter-iamguarded-to-docker && ./result/bin/load-nginx-prometheus-exporter-iamguarded-to-docker
```

# nginx-prometheus-exporter-nixchart

Nginx prometheus exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-prometheus-exporter-nixchart

# Load into Docker
nix build .#load-nginx-prometheus-exporter-nixchart-to-docker && ./result/bin/load-nginx-prometheus-exporter-nixchart-to-docker
```

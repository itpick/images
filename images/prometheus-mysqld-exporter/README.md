# prometheus-mysqld-exporter

Minimal Prometheus mysqld exporter Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-mysqld-exporter

# Load into Docker
nix build .#load-prometheus-mysqld-exporter-to-docker && ./result/bin/load-prometheus-mysqld-exporter-to-docker
```

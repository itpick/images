# apache-exporter

apache-exporter exposes Apache HTTP server metrics from mod_status in Prometheus format for monitoring

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-exporter

# Load into Docker
nix build .#load-apache-exporter-to-docker && ./result/bin/load-apache-exporter-to-docker
```

# prometheus-nixchart

Prometheus is a monitoring system and time series database

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-nixchart

# Load into Docker
nix build .#load-prometheus-nixchart-to-docker && ./result/bin/load-prometheus-nixchart-to-docker
```

# prometheus-alertmanager-nixchart

The Alertmanager handles alerts sent by client applications such as the Prometheus server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-alertmanager-nixchart

# Load into Docker
nix build .#load-prometheus-alertmanager-nixchart-to-docker && ./result/bin/load-prometheus-alertmanager-nixchart-to-docker
```

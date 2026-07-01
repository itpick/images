# prometheus-alertmanager-nixchart-fips

The Alertmanager handles alerts sent by client applications such as the Prometheus server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-alertmanager-nixchart-fips

# Load into Docker
nix build .#load-prometheus-alertmanager-nixchart-fips-to-docker && ./result/bin/load-prometheus-alertmanager-nixchart-fips-to-docker
```

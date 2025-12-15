# prometheus-alertmanager-iamguarded-fips

The Alertmanager handles alerts sent by client applications such as the Prometheus server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-alertmanager-iamguarded-fips

# Load into Docker
nix build .#load-prometheus-alertmanager-iamguarded-fips-to-docker && ./result/bin/load-prometheus-alertmanager-iamguarded-fips-to-docker
```

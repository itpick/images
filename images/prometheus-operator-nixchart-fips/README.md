# prometheus-operator-nixchart-fips

Prometheus Operator creates/configures/manages Prometheus clusters atop Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-operator-nixchart-fips

# Load into Docker
nix build .#load-prometheus-operator-nixchart-fips-to-docker && ./result/bin/load-prometheus-operator-nixchart-fips-to-docker
```

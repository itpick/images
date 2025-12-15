# grafana-operator

A Wolfi-powered operator for Grafana that installs and manages Grafana instances, Dashboards and Datasources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-operator

# Load into Docker
nix build .#load-grafana-operator-to-docker && ./result/bin/load-grafana-operator-to-docker
```

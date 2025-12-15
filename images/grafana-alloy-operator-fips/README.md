# grafana-alloy-operator-fips

The Alloy Operator is a Kubernetes Operator that manages the lifecycle of Grafana Alloy instances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-alloy-operator-fips

# Load into Docker
nix build .#load-grafana-alloy-operator-fips-to-docker && ./result/bin/load-grafana-alloy-operator-fips-to-docker
```

# prometheus-operator-iamguarded-fips

Prometheus Operator creates/configures/manages Prometheus clusters atop Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-operator-iamguarded-fips

# Load into Docker
nix build .#load-prometheus-operator-iamguarded-fips-to-docker && ./result/bin/load-prometheus-operator-iamguarded-fips-to-docker
```

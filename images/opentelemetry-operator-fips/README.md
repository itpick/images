# opentelemetry-operator-fips

Kubernetes Operator for OpenTelemetry Collector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentelemetry-operator-fips

# Load into Docker
nix build .#load-opentelemetry-operator-fips-to-docker && ./result/bin/load-opentelemetry-operator-fips-to-docker
```

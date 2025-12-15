# opentelemetry-operator-target-allocator-fips

Kubernetes Operator for OpenTelemetry Collector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentelemetry-operator-target-allocator-fips

# Load into Docker
nix build .#load-opentelemetry-operator-target-allocator-fips-to-docker && ./result/bin/load-opentelemetry-operator-target-allocator-fips-to-docker
```

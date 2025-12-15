# opentelemetry-operator

Kubernetes Operator for OpenTelemetry Collector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentelemetry-operator

# Load into Docker
nix build .#load-opentelemetry-operator-to-docker && ./result/bin/load-opentelemetry-operator-to-docker
```

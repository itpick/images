# jaeger-collector

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-collector

# Load into Docker
nix build .#load-jaeger-collector-to-docker && ./result/bin/load-jaeger-collector-to-docker
```

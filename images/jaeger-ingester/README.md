# jaeger-ingester

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-ingester

# Load into Docker
nix build .#load-jaeger-ingester-to-docker && ./result/bin/load-jaeger-ingester-to-docker
```

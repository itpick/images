# jaeger-es-rollover

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-es-rollover

# Load into Docker
nix build .#load-jaeger-es-rollover-to-docker && ./result/bin/load-jaeger-es-rollover-to-docker
```

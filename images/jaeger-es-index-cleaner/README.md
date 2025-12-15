# jaeger-es-index-cleaner

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-es-index-cleaner

# Load into Docker
nix build .#load-jaeger-es-index-cleaner-to-docker && ./result/bin/load-jaeger-es-index-cleaner-to-docker
```

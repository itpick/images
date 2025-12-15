# jaeger-query

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-query

# Load into Docker
nix build .#load-jaeger-query-to-docker && ./result/bin/load-jaeger-query-to-docker
```

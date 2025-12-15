# jaeger-all-in-one

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-all-in-one

# Load into Docker
nix build .#load-jaeger-all-in-one-to-docker && ./result/bin/load-jaeger-all-in-one-to-docker
```

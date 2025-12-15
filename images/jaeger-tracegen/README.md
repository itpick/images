# jaeger-tracegen

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-tracegen

# Load into Docker
nix build .#load-jaeger-tracegen-to-docker && ./result/bin/load-jaeger-tracegen-to-docker
```

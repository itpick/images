# jaeger-anonymizer

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-anonymizer

# Load into Docker
nix build .#load-jaeger-anonymizer-to-docker && ./result/bin/load-jaeger-anonymizer-to-docker
```

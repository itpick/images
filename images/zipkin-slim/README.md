# zipkin-slim

Smaller distribution of Zipkin which supports Elasticsearch storage and HTTP or gRPC span collection

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zipkin-slim

# Load into Docker
nix build .#load-zipkin-slim-to-docker && ./result/bin/load-zipkin-slim-to-docker
```

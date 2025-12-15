# zipkin

Zipkin is a distributed tracing system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zipkin

# Load into Docker
nix build .#load-zipkin-to-docker && ./result/bin/load-zipkin-to-docker
```

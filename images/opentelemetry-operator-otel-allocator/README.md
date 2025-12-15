# opentelemetry-operator-otel-allocator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentelemetry-operator-otel-allocator

# Load into Docker
nix build .#load-opentelemetry-operator-otel-allocator-to-docker && ./result/bin/load-opentelemetry-operator-otel-allocator-to-docker
```

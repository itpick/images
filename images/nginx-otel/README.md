# nginx-otel

Minimal Wolfi-based nginx HTTP server with OpenTelemetry observability integration for distributed tracing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-otel

# Load into Docker
nix build .#load-nginx-otel-to-docker && ./result/bin/load-nginx-otel-to-docker
```

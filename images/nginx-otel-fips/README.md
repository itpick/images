# nginx-otel-fips

Minimal Wolfi-based nginx HTTP server with OpenTelemetry observability integration and FIPS 140-2 hardened cryptography

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-otel-fips

# Load into Docker
nix build .#load-nginx-otel-fips-to-docker && ./result/bin/load-nginx-otel-fips-to-docker
```

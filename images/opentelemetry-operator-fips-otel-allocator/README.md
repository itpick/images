# opentelemetry-operator-fips-otel-allocator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentelemetry-operator-fips-otel-allocator

# Load into Docker
nix build .#load-opentelemetry-operator-fips-otel-allocator-to-docker && ./result/bin/load-opentelemetry-operator-fips-otel-allocator-to-docker
```

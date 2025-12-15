# jaeger-2-fips-ingester

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-2-fips-ingester

# Load into Docker
nix build .#load-jaeger-2-fips-ingester-to-docker && ./result/bin/load-jaeger-2-fips-ingester-to-docker
```

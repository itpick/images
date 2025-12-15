# jaeger-ingester-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-ingester-fips

# Load into Docker
nix build .#load-jaeger-ingester-fips-to-docker && ./result/bin/load-jaeger-ingester-fips-to-docker
```

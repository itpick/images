# jaeger-es-rollover-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-es-rollover-fips

# Load into Docker
nix build .#load-jaeger-es-rollover-fips-to-docker && ./result/bin/load-jaeger-es-rollover-fips-to-docker
```

# jaeger-es-index-cleaner-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-es-index-cleaner-fips

# Load into Docker
nix build .#load-jaeger-es-index-cleaner-fips-to-docker && ./result/bin/load-jaeger-es-index-cleaner-fips-to-docker
```

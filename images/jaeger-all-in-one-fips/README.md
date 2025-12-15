# jaeger-all-in-one-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-all-in-one-fips

# Load into Docker
nix build .#load-jaeger-all-in-one-fips-to-docker && ./result/bin/load-jaeger-all-in-one-fips-to-docker
```

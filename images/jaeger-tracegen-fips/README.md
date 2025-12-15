# jaeger-tracegen-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-tracegen-fips

# Load into Docker
nix build .#load-jaeger-tracegen-fips-to-docker && ./result/bin/load-jaeger-tracegen-fips-to-docker
```

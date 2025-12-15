# jaeger-anonymizer-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-anonymizer-fips

# Load into Docker
nix build .#load-jaeger-anonymizer-fips-to-docker && ./result/bin/load-jaeger-anonymizer-fips-to-docker
```

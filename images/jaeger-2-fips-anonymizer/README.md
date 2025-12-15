# jaeger-2-fips-anonymizer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-2-fips-anonymizer

# Load into Docker
nix build .#load-jaeger-2-fips-anonymizer-to-docker && ./result/bin/load-jaeger-2-fips-anonymizer-to-docker
```

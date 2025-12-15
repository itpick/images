# jaeger-2-anonymizer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-2-anonymizer

# Load into Docker
nix build .#load-jaeger-2-anonymizer-to-docker && ./result/bin/load-jaeger-2-anonymizer-to-docker
```

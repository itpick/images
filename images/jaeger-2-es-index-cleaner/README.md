# jaeger-2-es-index-cleaner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-2-es-index-cleaner

# Load into Docker
nix build .#load-jaeger-2-es-index-cleaner-to-docker && ./result/bin/load-jaeger-2-es-index-cleaner-to-docker
```

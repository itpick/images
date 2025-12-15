# jaeger-2-es-rollover

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-2-es-rollover

# Load into Docker
nix build .#load-jaeger-2-es-rollover-to-docker && ./result/bin/load-jaeger-2-es-rollover-to-docker
```

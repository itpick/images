# jaeger-operator

Minimal jaeger-operator container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-operator

# Load into Docker
nix build .#load-jaeger-operator-to-docker && ./result/bin/load-jaeger-operator-to-docker
```

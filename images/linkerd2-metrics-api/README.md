# linkerd2-metrics-api

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd2-metrics-api

# Load into Docker
nix build .#load-linkerd2-metrics-api-to-docker && ./result/bin/load-linkerd2-metrics-api-to-docker
```

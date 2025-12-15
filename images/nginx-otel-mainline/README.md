# nginx-otel-mainline

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-otel-mainline

# Load into Docker
nix build .#load-nginx-otel-mainline-to-docker && ./result/bin/load-nginx-otel-mainline-to-docker
```

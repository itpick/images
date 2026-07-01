# envoy-nixchart

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#envoy-nixchart

# Load into Docker
nix build .#load-envoy-nixchart-to-docker && ./result/bin/load-envoy-nixchart-to-docker
```

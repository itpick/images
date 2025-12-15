# nri-prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-prometheus

# Load into Docker
nix build .#load-nri-prometheus-to-docker && ./result/bin/load-nri-prometheus-to-docker
```

# prometheus-json-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-json-exporter

# Load into Docker
nix build .#load-prometheus-json-exporter-to-docker && ./result/bin/load-prometheus-json-exporter-to-docker
```

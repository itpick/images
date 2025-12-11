# grafana-image-renderer

A Grafana backend plugin that handles rendering of panels & dashboards to PNGs using headless browser (Chromium/Chrome)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 19s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#grafana-image-renderer

# Load into Docker
nix build .#load-grafana-image-renderer-to-docker && ./result/bin/load-grafana-image-renderer-to-docker
```

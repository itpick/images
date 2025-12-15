# grafana

A minimal wolfi-based image for grafana, which is an open-source monitoring and observability application

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#grafana

# Load into Docker
nix build .#load-grafana-to-docker && ./result/bin/load-grafana-to-docker
```

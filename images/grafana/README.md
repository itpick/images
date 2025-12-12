# grafana

A minimal wolfi-based image for grafana, which is an open-source monitoring and observability application

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 11s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.25 GB |
| Uncompressed | ~3.13 GB |

## Usage

```bash
# Build the image
nix build .#grafana

# Load into Docker
nix build .#load-grafana-to-docker && ./result/bin/load-grafana-to-docker
```

# harbor-exporter

A Wolf-based image for Harbor Exporter - application for monitoring harbor deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#harbor-exporter

# Load into Docker
nix build .#load-harbor-exporter-to-docker && ./result/bin/load-harbor-exporter-to-docker
```

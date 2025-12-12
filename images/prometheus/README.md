# prometheus

Chainguard image for Prometheus, a systems and service monitoring system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 364.72 MB |
| Uncompressed | ~911.80 MB |

## Usage

```bash
# Build the image
nix build .#prometheus

# Load into Docker
nix build .#load-prometheus-to-docker && ./result/bin/load-prometheus-to-docker
```

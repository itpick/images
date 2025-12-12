# prometheus-pushgateway

Minimal Prometheus Pushgateway Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 121.22 MB |
| Uncompressed | ~303.06 MB |

## Usage

```bash
# Build the image
nix build .#prometheus-pushgateway

# Load into Docker
nix build .#load-prometheus-pushgateway-to-docker && ./result/bin/load-prometheus-pushgateway-to-docker
```

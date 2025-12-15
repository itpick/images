# prometheus

Chainguard image for Prometheus, a systems and service monitoring system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus

# Load into Docker
nix build .#load-prometheus-to-docker && ./result/bin/load-prometheus-to-docker
```

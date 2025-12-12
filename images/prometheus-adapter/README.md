# prometheus-adapter

prometheus-adapter is a Prometheus project used to collect Prometheus metrics in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 52s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 159.81 MB |
| Uncompressed | ~399.54 MB |

## Usage

```bash
# Build the image
nix build .#prometheus-adapter

# Load into Docker
nix build .#load-prometheus-adapter-to-docker && ./result/bin/load-prometheus-adapter-to-docker
```

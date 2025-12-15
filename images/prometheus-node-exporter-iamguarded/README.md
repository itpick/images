# prometheus-node-exporter-iamguarded

Prometheus exporter for hardware and OS metrics exposed by LINUX kernels

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-node-exporter-iamguarded

# Load into Docker
nix build .#load-prometheus-node-exporter-iamguarded-to-docker && ./result/bin/load-prometheus-node-exporter-iamguarded-to-docker
```

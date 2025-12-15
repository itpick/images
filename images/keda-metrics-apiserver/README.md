# keda-metrics-apiserver

Minimal image with the Keda binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#keda-metrics-apiserver

# Load into Docker
nix build .#load-keda-metrics-apiserver-to-docker && ./result/bin/load-keda-metrics-apiserver-to-docker
```

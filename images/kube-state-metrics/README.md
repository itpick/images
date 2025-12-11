# kube-state-metrics

Minimal Kube State Metrics Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kube-state-metrics

# Load into Docker
nix build .#load-kube-state-metrics-to-docker && ./result/bin/load-kube-state-metrics-to-docker
```

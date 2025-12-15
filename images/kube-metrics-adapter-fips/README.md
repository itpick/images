# kube-metrics-adapter-fips

Minimal Adapter to expose custom metrics to Kubernetes HPA via Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-metrics-adapter-fips

# Load into Docker
nix build .#load-kube-metrics-adapter-fips-to-docker && ./result/bin/load-kube-metrics-adapter-fips-to-docker
```

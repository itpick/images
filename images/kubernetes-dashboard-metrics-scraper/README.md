# kubernetes-dashboard-metrics-scraper

Module containing the Kubernetes metrics scraper module of the Kubernetes dashboard application

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dashboard-metrics-scraper

# Load into Docker
nix build .#load-kubernetes-dashboard-metrics-scraper-to-docker && ./result/bin/load-kubernetes-dashboard-metrics-scraper-to-docker
```

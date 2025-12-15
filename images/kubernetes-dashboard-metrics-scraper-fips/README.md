# kubernetes-dashboard-metrics-scraper-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dashboard-metrics-scraper-fips

# Load into Docker
nix build .#load-kubernetes-dashboard-metrics-scraper-fips-to-docker && ./result/bin/load-kubernetes-dashboard-metrics-scraper-fips-to-docker
```

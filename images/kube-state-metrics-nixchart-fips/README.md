# kube-state-metrics-nixchart-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-state-metrics-nixchart-fips

# Load into Docker
nix build .#load-kube-state-metrics-nixchart-fips-to-docker && ./result/bin/load-kube-state-metrics-nixchart-fips-to-docker
```

# victoria-metrics-fips

VictoriaMetrics standalone image is a fast, cost-effective and scalable monitoring solution and time series database

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#victoria-metrics-fips

# Load into Docker
nix build .#load-victoria-metrics-fips-to-docker && ./result/bin/load-victoria-metrics-fips-to-docker
```

# grafana-fips

A minimal wolfi-based image for grafana, which is an open-source monitoring and observability application

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-fips

# Load into Docker
nix build .#load-grafana-fips-to-docker && ./result/bin/load-grafana-fips-to-docker
```

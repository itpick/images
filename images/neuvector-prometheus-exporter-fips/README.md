# neuvector-prometheus-exporter-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neuvector-prometheus-exporter-fips

# Load into Docker
nix build .#load-neuvector-prometheus-exporter-fips-to-docker && ./result/bin/load-neuvector-prometheus-exporter-fips-to-docker
```

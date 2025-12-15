# prometheus-node-exporter-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-node-exporter-fips

# Load into Docker
nix build .#load-prometheus-node-exporter-fips-to-docker && ./result/bin/load-prometheus-node-exporter-fips-to-docker
```

# pgpool2_exporter

Prometheus exporter image for Pgpool-II metrics

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgpool2_exporter

# Load into Docker
nix build .#load-pgpool2_exporter-to-docker && ./result/bin/load-pgpool2_exporter-to-docker
```

# prometheus-process-exporter-fips

process-exporter is an agent that collects process-specific metrics from a system and exposes them in a format that can be ingested by Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-process-exporter-fips

# Load into Docker
nix build .#load-prometheus-process-exporter-fips-to-docker && ./result/bin/load-prometheus-process-exporter-fips-to-docker
```

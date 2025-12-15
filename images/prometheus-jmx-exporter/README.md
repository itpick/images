# prometheus-jmx-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-jmx-exporter

# Load into Docker
nix build .#load-prometheus-jmx-exporter-to-docker && ./result/bin/load-prometheus-jmx-exporter-to-docker
```

# falco-exporter

Prometheus Metrics Exporter for Falco output events

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falco-exporter

# Load into Docker
nix build .#load-falco-exporter-to-docker && ./result/bin/load-falco-exporter-to-docker
```

# prometheus-snmp-exporter

SNMP Exporter for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-snmp-exporter

# Load into Docker
nix build .#load-prometheus-snmp-exporter-to-docker && ./result/bin/load-prometheus-snmp-exporter-to-docker
```

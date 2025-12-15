# snmp-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#snmp-exporter

# Load into Docker
nix build .#load-snmp-exporter-to-docker && ./result/bin/load-snmp-exporter-to-docker
```

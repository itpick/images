# prometheus-sql-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-sql-exporter

# Load into Docker
nix build .#load-prometheus-sql-exporter-to-docker && ./result/bin/load-prometheus-sql-exporter-to-docker
```

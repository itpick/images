# influxdb

Minimal image with influxdb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#influxdb

# Load into Docker
nix build .#load-influxdb-to-docker && ./result/bin/load-influxdb-to-docker
```

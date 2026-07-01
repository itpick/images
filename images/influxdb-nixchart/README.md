# influxdb-nixchart

InfluxDB is a time series database designed to handle high write and query loads

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#influxdb-nixchart

# Load into Docker
nix build .#load-influxdb-nixchart-to-docker && ./result/bin/load-influxdb-nixchart-to-docker
```

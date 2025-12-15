# influxdb-iamguarded

InfluxDB is a time series database designed to handle high write and query loads

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#influxdb-iamguarded

# Load into Docker
nix build .#load-influxdb-iamguarded-to-docker && ./result/bin/load-influxdb-iamguarded-to-docker
```

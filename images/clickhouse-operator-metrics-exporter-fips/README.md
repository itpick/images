# clickhouse-operator-metrics-exporter-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clickhouse-operator-metrics-exporter-fips

# Load into Docker
nix build .#load-clickhouse-operator-metrics-exporter-fips-to-docker && ./result/bin/load-clickhouse-operator-metrics-exporter-fips-to-docker
```

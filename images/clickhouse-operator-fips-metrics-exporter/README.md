# clickhouse-operator-fips-metrics-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clickhouse-operator-fips-metrics-exporter

# Load into Docker
nix build .#load-clickhouse-operator-fips-metrics-exporter-to-docker && ./result/bin/load-clickhouse-operator-fips-metrics-exporter-to-docker
```

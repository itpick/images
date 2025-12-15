# clickhouse-operator-metrics-exporter

Kubernetes Operator for ClickHouse. Creates, configures and manages ClickHouse clusters running on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clickhouse-operator-metrics-exporter

# Load into Docker
nix build .#load-clickhouse-operator-metrics-exporter-to-docker && ./result/bin/load-clickhouse-operator-metrics-exporter-to-docker
```

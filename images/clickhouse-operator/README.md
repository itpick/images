# clickhouse-operator

Kubernetes Operator for ClickHouse. Creates, configures and manages ClickHouse clusters running on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clickhouse-operator

# Load into Docker
nix build .#load-clickhouse-operator-to-docker && ./result/bin/load-clickhouse-operator-to-docker
```

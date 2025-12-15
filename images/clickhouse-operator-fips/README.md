# clickhouse-operator-fips

Kubernetes Operator for ClickHouse. Creates, configures and manages ClickHouse clusters running on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clickhouse-operator-fips

# Load into Docker
nix build .#load-clickhouse-operator-fips-to-docker && ./result/bin/load-clickhouse-operator-fips-to-docker
```

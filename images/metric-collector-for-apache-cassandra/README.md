# metric-collector-for-apache-cassandra

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metric-collector-for-apache-cassandra

# Load into Docker
nix build .#load-metric-collector-for-apache-cassandra-to-docker && ./result/bin/load-metric-collector-for-apache-cassandra-to-docker
```

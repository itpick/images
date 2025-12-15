# debezium-connector-db2

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#debezium-connector-db2

# Load into Docker
nix build .#load-debezium-connector-db2-to-docker && ./result/bin/load-debezium-connector-db2-to-docker
```

# debezium-3.0-connector-mariadb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#debezium-3.0-connector-mariadb

# Load into Docker
nix build .#load-debezium-3.0-connector-mariadb-to-docker && ./result/bin/load-debezium-3.0-connector-mariadb-to-docker
```

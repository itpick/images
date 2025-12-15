# debezium-connector-spanner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#debezium-connector-spanner

# Load into Docker
nix build .#load-debezium-connector-spanner-to-docker && ./result/bin/load-debezium-connector-spanner-to-docker
```

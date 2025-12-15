# debezium-connector-vitess

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#debezium-connector-vitess

# Load into Docker
nix build .#load-debezium-connector-vitess-to-docker && ./result/bin/load-debezium-connector-vitess-to-docker
```

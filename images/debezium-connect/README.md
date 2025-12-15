# debezium-connect

Kafka Connect image with all Debezium connectors, and part of the Debezium platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#debezium-connect

# Load into Docker
nix build .#load-debezium-connect-to-docker && ./result/bin/load-debezium-connect-to-docker
```

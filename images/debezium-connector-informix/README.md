# debezium-connector-informix

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#debezium-connector-informix

# Load into Docker
nix build .#load-debezium-connector-informix-to-docker && ./result/bin/load-debezium-connector-informix-to-docker
```

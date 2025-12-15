# debezium-connector-ibmi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#debezium-connector-ibmi

# Load into Docker
nix build .#load-debezium-connector-ibmi-to-docker && ./result/bin/load-debezium-connector-ibmi-to-docker
```

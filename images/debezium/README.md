# debezium

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#debezium

# Load into Docker
nix build .#load-debezium-to-docker && ./result/bin/load-debezium-to-docker
```

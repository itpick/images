# nri-rabbitmq

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-rabbitmq

# Load into Docker
nix build .#load-nri-rabbitmq-to-docker && ./result/bin/load-nri-rabbitmq-to-docker
```

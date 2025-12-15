# nri-kafka

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-kafka

# Load into Docker
nix build .#load-nri-kafka-to-docker && ./result/bin/load-nri-kafka-to-docker
```

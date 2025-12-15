# kafka

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka

# Load into Docker
nix build .#load-kafka-to-docker && ./result/bin/load-kafka-to-docker
```

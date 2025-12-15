# strimzi-kafka

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#strimzi-kafka

# Load into Docker
nix build .#load-strimzi-kafka-to-docker && ./result/bin/load-strimzi-kafka-to-docker
```

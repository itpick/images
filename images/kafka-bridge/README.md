# kafka-bridge

HTTP-based bridge for Apache Kafka using Vert.x framework

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka-bridge

# Load into Docker
nix build .#load-kafka-bridge-to-docker && ./result/bin/load-kafka-bridge-to-docker
```

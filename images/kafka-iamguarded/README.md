# kafka-iamguarded

Apache Kafka distributed event store and stream-processing platform, compatible with iamguarded charts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka-iamguarded

# Load into Docker
nix build .#load-kafka-iamguarded-to-docker && ./result/bin/load-kafka-iamguarded-to-docker
```

# kafka-nixchart

Apache Kafka distributed event store and stream-processing platform, compatible with iamguarded charts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka-nixchart

# Load into Docker
nix build .#load-kafka-nixchart-to-docker && ./result/bin/load-kafka-nixchart-to-docker
```

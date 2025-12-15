# confluent-kafka

A Wolfi-based container image for the Community Edition of Confluent Kafka (cp-kafka), which extends Apache Kafka with additional features

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#confluent-kafka

# Load into Docker
nix build .#load-confluent-kafka-to-docker && ./result/bin/load-confluent-kafka-to-docker
```

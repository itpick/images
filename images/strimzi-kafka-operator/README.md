# strimzi-kafka-operator

Strimzi provides a way to run an Apache Kafka cluster on Kubernetes in various deployment configurations

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#strimzi-kafka-operator

# Load into Docker
nix build .#load-strimzi-kafka-operator-to-docker && ./result/bin/load-strimzi-kafka-operator-to-docker
```

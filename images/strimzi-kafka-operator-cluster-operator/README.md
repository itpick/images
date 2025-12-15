# strimzi-kafka-operator-cluster-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#strimzi-kafka-operator-cluster-operator

# Load into Docker
nix build .#load-strimzi-kafka-operator-cluster-operator-to-docker && ./result/bin/load-strimzi-kafka-operator-cluster-operator-to-docker
```

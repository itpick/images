# strimzi-kafka-operator-kafka-init

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#strimzi-kafka-operator-kafka-init

# Load into Docker
nix build .#load-strimzi-kafka-operator-kafka-init-to-docker && ./result/bin/load-strimzi-kafka-operator-kafka-init-to-docker
```

# strimzi-kafka-operator-user-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#strimzi-kafka-operator-user-operator

# Load into Docker
nix build .#load-strimzi-kafka-operator-user-operator-to-docker && ./result/bin/load-strimzi-kafka-operator-user-operator-to-docker
```

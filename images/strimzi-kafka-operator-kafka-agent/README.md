# strimzi-kafka-operator-kafka-agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#strimzi-kafka-operator-kafka-agent

# Load into Docker
nix build .#load-strimzi-kafka-operator-kafka-agent-to-docker && ./result/bin/load-strimzi-kafka-operator-kafka-agent-to-docker
```

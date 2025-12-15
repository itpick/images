# akhq

Kafka GUI for Apache Kafka to manage topics, topics data, consumers group, schema registry

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#akhq

# Load into Docker
nix build .#load-akhq-to-docker && ./result/bin/load-akhq-to-docker
```

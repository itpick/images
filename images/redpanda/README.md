# redpanda

Redpanda is a Kafka-compatible streaming data platform with no JVM dependencies

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redpanda

# Load into Docker
nix build .#load-redpanda-to-docker && ./result/bin/load-redpanda-to-docker
```

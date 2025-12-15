# kafka-exporter

Kafka exporter for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka-exporter

# Load into Docker
nix build .#load-kafka-exporter-to-docker && ./result/bin/load-kafka-exporter-to-docker
```

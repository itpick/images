# kafka_exporter

Kafka exporter for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka_exporter

# Load into Docker
nix build .#load-kafka_exporter-to-docker && ./result/bin/load-kafka_exporter-to-docker
```

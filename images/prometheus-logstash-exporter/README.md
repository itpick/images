# prometheus-logstash-exporter

Prometheus exporter for Logstash written in Go

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-logstash-exporter

# Load into Docker
nix build .#load-prometheus-logstash-exporter-to-docker && ./result/bin/load-prometheus-logstash-exporter-to-docker
```

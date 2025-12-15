# splunk-otel-collector

Splunk OpenTelemetry Collector is a distribution of the OpenTelemetry Collector. It provides a unified way to receive, process, and export metric, trace, and log data for Splunk Observability Cloud

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#splunk-otel-collector

# Load into Docker
nix build .#load-splunk-otel-collector-to-docker && ./result/bin/load-splunk-otel-collector-to-docker
```

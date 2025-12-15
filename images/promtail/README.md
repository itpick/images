# promtail

This image contains the promtail application for log aggregation. promtail is the log aggregator that ships logs to Loki and/or Prometheus. It runs as an agent and scrapes logs from files, containers, and hosts and ships them to a logging backend

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#promtail

# Load into Docker
nix build .#load-promtail-to-docker && ./result/bin/load-promtail-to-docker
```

# promtail-fips

This image contains the promtail application for log aggregation. promtail is the log aggregator that ships logs to Loki and/or Prometheus. It runs as an agent and scrapes logs from files, containers, and hosts and ships them to a logging backend

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#promtail-fips

# Load into Docker
nix build .#load-promtail-fips-to-docker && ./result/bin/load-promtail-fips-to-docker
```

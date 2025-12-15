# prometheus-blackbox-exporter

Prometheus blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP, ICMP and gRPC

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#prometheus-blackbox-exporter

# Load into Docker
nix build .#load-prometheus-blackbox-exporter-to-docker && ./result/bin/load-prometheus-blackbox-exporter-to-docker
```

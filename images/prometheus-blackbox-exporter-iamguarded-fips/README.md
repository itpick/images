# prometheus-blackbox-exporter-iamguarded-fips

Prometheus blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP, ICMP and gRPC

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-blackbox-exporter-iamguarded-fips

# Load into Docker
nix build .#load-prometheus-blackbox-exporter-iamguarded-fips-to-docker && ./result/bin/load-prometheus-blackbox-exporter-iamguarded-fips-to-docker
```

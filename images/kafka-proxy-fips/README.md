# kafka-proxy-fips

Proxy connections to Kafka cluster. Connect through SOCKS Proxy, HTTP Proxy or to cluster running in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka-proxy-fips

# Load into Docker
nix build .#load-kafka-proxy-fips-to-docker && ./result/bin/load-kafka-proxy-fips-to-docker
```

# kafka-proxy

Proxy connections to Kafka cluster. Connect through SOCKS Proxy, HTTP Proxy or to cluster running in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka-proxy

# Load into Docker
nix build .#load-kafka-proxy-to-docker && ./result/bin/load-kafka-proxy-to-docker
```

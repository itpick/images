# rabbitmq-cluster-operator

RabbitMQ Cluster Kubernetes Operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-cluster-operator

# Load into Docker
nix build .#load-rabbitmq-cluster-operator-to-docker && ./result/bin/load-rabbitmq-cluster-operator-to-docker
```

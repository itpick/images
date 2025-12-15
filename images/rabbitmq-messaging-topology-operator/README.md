# rabbitmq-messaging-topology-operator

RabbitMQ messaging topology operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-messaging-topology-operator

# Load into Docker
nix build .#load-rabbitmq-messaging-topology-operator-to-docker && ./result/bin/load-rabbitmq-messaging-topology-operator-to-docker
```

# rabbitmq

RabbitMQ RabbitMQ is a message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#rabbitmq

# Load into Docker
nix build .#load-rabbitmq-to-docker && ./result/bin/load-rabbitmq-to-docker
```

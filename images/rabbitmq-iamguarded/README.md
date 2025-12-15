# rabbitmq-iamguarded

RabbitMQ RabbitMQ is a message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-iamguarded

# Load into Docker
nix build .#load-rabbitmq-iamguarded-to-docker && ./result/bin/load-rabbitmq-iamguarded-to-docker
```
